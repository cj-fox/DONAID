import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donaid/Donor/updateFavorite.dart';
import 'package:donaid/Models/Beneficiary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:overlay_support/overlay_support.dart';
import 'DonorWidgets/donor_bottom_navigation_bar.dart';
import 'DonorWidgets/donor_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class BeneficiaryDonateScreen extends StatefulWidget {
  Beneficiary beneficiary;
  BeneficiaryDonateScreen(this.beneficiary, {Key? key}) : super(key: key);

  @override
  _BeneficiaryDonateScreenState createState() =>
      _BeneficiaryDonateScreenState();
}

class _BeneficiaryDonateScreenState extends State<BeneficiaryDonateScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Map<String, dynamic>? paymentIntentData;
  String donationAmount = "";
  bool showLoadingSpinner = false;
  var f = NumberFormat("###,##0.00", "en_US");
  User? loggedInUser;
  var pointlist = [];

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getFavorite();
  }

  void _getCurrentUser() {
    loggedInUser = _auth.currentUser;
  }

  _refreshPage() async {
    var ret = await _firestore
        .collection('Beneficiaries')
        .where('id', isEqualTo: widget.beneficiary.id)
        .get();

    var doc = ret.docs[0];
    widget.beneficiary.amountRaised = doc['amountRaised'];
    widget.beneficiary.active = doc['active'];

    setState(() {});
  }

  Future<void> _confirmDonationAmount() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text('Are You Sure?'.tr),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            content: Text(
                "We see that you have entered a donation amount greater than \$999. We appreciate your generosity, but please confirm that this amount is correct to proceed."
                    .tr),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async{
                          Navigator.pop(context);
                          await makePayment();
                        },
                        child: const Text('Yes'),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }
// get Favorite from firebase
  _getFavorite() async {
    await _firestore
        .collection("Favorite")
        .doc(loggedInUser!.uid)
        .get()
        .then((value) {
      setState(() {
        pointlist = List.from(value['favoriteList']);
      });
    });
  }

  _beneficiaryDonateBody() {
    return ModalProgressHUD(
      inAsyncCall: showLoadingSpinner,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
            child: Padding(
              // Favorite button
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            (_auth.currentUser?.email != null)
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        pointlist.contains(widget.beneficiary.id.toString())
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            pointlist.contains(widget.beneficiary.id.toString())
                                ? Colors.red
                                : null,
                        size: 40,
                      ),
                      onPressed: () async {
                        await updateFavorites(loggedInUser!.uid.toString(),
                            widget.beneficiary.id.toString());
                        await _getFavorite();
                  },
                    ),
                  )
                : Container(),
            SizedBox(height: 100, child: Image.asset('assets/DONAID_LOGO.png')),
            SizedBox(height: 10),
            Text(
              widget.beneficiary.name,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              widget.beneficiary.biography,
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$' + f.format(widget.beneficiary.amountRaised),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      '\$' + f.format(widget.beneficiary.goalAmount),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                    value: (widget.beneficiary.amountRaised /
                        widget.beneficiary.goalAmount),
                    minHeight: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: (widget.beneficiary.active == true &&
                      (widget.beneficiary.endDate).compareTo(Timestamp.now()) >
                          0)
                  ? Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              onChanged: (value) {
                                donationAmount = value.toString();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please_enter_a_valid_payment_amount'
                                      .tr;
                                } else if (double.parse(value) < 0.50) {
                                  return 'please_provide_a_donation_minimum'.tr;
                                } else {
                                  return null;
                                }
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  label: Center(
                                    child: RichText(
                                        text: TextSpan(
                                      text: 'donation_amount'.tr,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 20.0),
                                    )),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 5.0,
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(32.0),
                              child: MaterialButton(
                                child: Text(
                                  'donate'.tr,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      showLoadingSpinner = true;
                                    });
                                    if (double.parse(donationAmount) > 999) {
                                      //If the donation is $1k or more, ask for confirmation
                                      _confirmDonationAmount();
                                    } else {
                                      //If donation is les than $1k, go into makePayment method
                                      await makePayment();
                                    }
                                    setState(() {
                                      showLoadingSpinner = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ))
                  : Text('beneficiary_is_no_longer_available'.tr, style: TextStyle(fontSize: 18),),
            )
          ]),
        )),
      ),
    );
  }
  void createDonationDocument() async {
    //This method creates a document in the Donations collection to keep record of this donation
    final docRef = await _firestore.collection('Donations').add({});

    await _firestore.collection('Donations').doc(docRef.id).set({
      'id': docRef.id,
      'donorID': _auth.currentUser?.uid,
      'organizationID': widget.beneficiary.organizationID,
      'charityID': widget.beneficiary.id,
      'charityName': widget.beneficiary.name,
      'donationAmount': donationAmount,
      'donatedAt': Timestamp.now(),
      'charityType': 'Beneficiaries',
      'category': widget.beneficiary.category
    });
  }

  void updateBeneficiary() async {
    //This method updates the beneficiary with this donation.
    if (widget.beneficiary.amountRaised + double.parse(donationAmount) >=
        widget.beneficiary.goalAmount) {
      //If this donation makes the beneficiary reach its goal amount, make the beneficiary inactive
      await _firestore
          .collection('Beneficiaries')
          .doc(widget.beneficiary.id)
          .update({
        'amountRaised':
            widget.beneficiary.amountRaised + double.parse(donationAmount),
        'active': false
      });
    } else {
      //If this donation did not make the beneficiary reach its goal, simply add the donated amount
      // to the amountRaised field
      await _firestore
          .collection('Beneficiaries')
          .doc(widget.beneficiary.id)
          .update({
        'amountRaised':
            widget.beneficiary.amountRaised + double.parse(donationAmount)
      });
    }
  }

  Future<void> makePayment() async {
    //This method calls the createPaymentIntent method and the calls the
    // method to create the payment sheet
    try {
      paymentIntentData = await createPaymentIntent(donationAmount, 'USD');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        applePay: true,
        googlePay: true,
        style: ThemeMode.dark,
        merchantCountryCode: 'US',
        merchantDisplayName: 'DONAID',
      ));

      print(paymentIntentData);
      await displayPaymentSheet();
    } catch (e) {
      print('Exception: ${e.toString()}');
    }
  }

  displayPaymentSheet() async {
    /*Displaying the payment sheet requires the client secret that is given from the payment intents
    * from the Stripe API (this is to keep track of this user's checkout session.*/
    try {
      await Stripe.instance.presentPaymentSheet(
        parameters: PresentPaymentSheetParameters(
          clientSecret: paymentIntentData!['client_secret'],
          confirmPayment: true,
        ),
      );

      setState(() {
        paymentIntentData = null;
      });
      //If the payment is successfully completed, show a message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('paid_successfully'.tr)));

      createDonationDocument();
      updateBeneficiary();
      await _refreshPage();

      showSimpleNotification(
        Text('Thank you!'),
        subtitle: Text('Your generosity is extremely appreciated!'),
        duration: Duration(seconds: 5),
        slideDismissDirection: DismissDirection.up,

      );

    } catch (e) {
      print('Stripe Exception: ${e.toString()}');

      //Show a message to indicate if the payment was cancelled
      ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(content: Text('payment_cancelled!'.tr)));
    }
  }

  createPaymentIntent(String amount, String currency) async {
    /*This method calls the node app to create a payment intent with the Stripe API.
    * The node app will then return the client secret that is needed to create the payment sheet*/
    try {
      final body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types': ['card']
      };

      var response = await http.post(
          Uri.https('donaidmobileapp.herokuapp.com', '/create-payment-intent'),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});

      print(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print('Exception: ${e.toString()}');
    }
  }

  calculateAmount(String amount) {
    /*Stripe takes the payment amount as an integer. The integer that it takes is the payment amount
    * in pennies. so $1.50 will be sent to Stripe as 150.
    *
    * This method parses the donation amount to a double (so that we can handle fractional dollar donations). Then it multiplies
    * by 100 to convert to pennies. Then it does toInt to convert to integer so that Stripe will accept it. We return that integer dollar
    * amount as a string that is sent to the API*/
    final price = (double.parse(amount) * 100).toInt();
    return price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //doubt
        title: Text('donate'.tr + ' - ${widget.beneficiary.name}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const DonorDrawer(),
      body: _beneficiaryDonateBody(),
      bottomNavigationBar: DonorBottomNavigationBar(),
    );
  }
}
