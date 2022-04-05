
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'organization_dashboard.dart';
import 'package:get/get.dart';

class AddBeneficiaryForm extends StatefulWidget {
  static const id = 'beneficiary_form_screen';
  const AddBeneficiaryForm({Key? key}) : super(key: key);

  @override
  _AddBeneficiaryFormState createState() => _AddBeneficiaryFormState();
}

class _AddBeneficiaryFormState extends State<AddBeneficiaryForm> {
  TextEditingController categoryController = new TextEditingController();
  TextEditingController biographyController = new TextEditingController();
  TextEditingController endDateController = new TextEditingController();
  TextEditingController goalAmountController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  bool showLoadingSpinner = false;
  final _formKey = GlobalKey<FormState>();
  static final goalRegExp = RegExp(
    r"^(?!0\.00)\d{1,13}(,\d{3})*(\.\d\d)?$"
  );
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  final firestore = FirebaseFirestore.instance;
  late DocumentSnapshot documentSnapshot;
  var category = [];
  int beneficiaryTimeLimit=0;
  bool? isAdopted = false;

  _getCampaign() async {
    var ret = await firestore
        .collection('CharityCategories')
        .get();
    ret.docs.forEach((element) {
      category.add(element.data()['name']);
    });

    setState(() {});
  }

  _getTimeLimit() async {
    var ret = await firestore.collection('AdminRestrictions').where('id',isEqualTo: 'CharityDurationLimits').get();

    var doc = ret.docs[0];
    beneficiaryTimeLimit = doc['beneficiaries'];
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getCampaign();
    _getTimeLimit();
  }

  void _getCurrentUser() {
    loggedInUser = _auth.currentUser;
  }


  Future<void> addBeneficiary(String category, String biography, double goalAmount,
      String name, String endDateController) async {
    try {
      final docRef = await firestore.collection("Beneficiaries").add({});

      await firestore.collection("Beneficiaries").doc(docRef.id).set({
        'active': true,
        'amountRaised': 0,
        'category': category,
        'dateCreated': FieldValue.serverTimestamp(),
        'biography': biography,
        'endDate': Timestamp.fromDate(DateTime.parse(endDateController)),
        'goalAmount': goalAmount,
        'id': docRef.id,
        'organizationID': loggedInUser?.uid,
        'name': name
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addAdoption(String category, String biography, double goalAmount,
      String name, String endDateController) async {
    try {
      final docRef = await firestore.collection("Adoptions").add({});
      await firestore.collection("Adoptions").doc(docRef.id).set({
        'active': true,
        'category': category,
        'dateCreated': FieldValue.serverTimestamp(),
        'biography': biography,
        'goalAmount': goalAmount,
        'amountRaised': 0,
        'id': docRef.id,
        'organizationID': loggedInUser?.uid,
        'name': name,
      });
    } catch (e) {
      print(e);
    }
  }

  Widget showEndDateField(){
    if(isAdopted == false){
      return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: endDateController,
            readOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter end date.";
              }
              if(DateTime.parse(value).difference(DateTime.now()).inDays > beneficiaryTimeLimit){
                return 'Beneficiaries cannot have a duration longer than 1 year.';
              }
              else {
                return null;
              }
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                label: Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Enter End Date',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 20.0),
                          children: const [
                            TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ])),
                ),
                border: const OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                )
            ),
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100));
              endDateController.text =
                  date.toString().substring(0, 10);
            },));
    }
    else{
      return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("donaid".tr),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ModalProgressHUD(
            inAsyncCall: showLoadingSpinner,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                         Center(
                          child: Text(
                            'add_beneficiary'.tr,
                            style: TextStyle(fontSize: 32.0),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                         Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: Text(
                            '* - required_fields'.tr,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLength: 50,
                            controller: nameController,
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(50)
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please_enter_a_nickname".tr;
                              } else {
                                return null;
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                label: Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'nickname'.tr,
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 20.0),
                                          children: const [
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ])),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            minLines: 2,
                            maxLines: 5,
                            maxLength: 240,
                            controller: biographyController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please_enter_a_biography".tr;
                              } else {
                                return null;
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                label: Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'biography'.tr,
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 20.0),
                                          children: const [
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ])),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: goalAmountController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please_enter_a_goal_amount.".tr;
                              } else if (!goalRegExp.hasMatch(value)) {
                                return "please_enter_a_valid_goal_amount.".tr;
                              }
                              else {
                                return null;
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                label: Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'goal'.tr + ' (USD)',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 20.0),
                                          children: const [
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ])),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                                )),
                          ),
                        ),

                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Set beneficiary up for adoption: ',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Checkbox(
                              value: isAdopted,
                              onChanged: (value) {
                                setState(() {
                                  isAdopted = value;
                                });
                              },
                            ),
                          ],
                        ))),
                        showEndDateField(),


                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField <String>(
                              decoration: InputDecoration(
                                  label: Center(
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'category'.tr,
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 20.0),
                                            children: const [
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ])),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                                  )),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: category == null ? [] : category.map((
                                  items) {
                                return DropdownMenuItem<String>(
                                  child: Text(items),
                                  value: items,
                                );
                              }).toList(),
                              onChanged: (val) =>
                                  setState(() {
                                    categoryController.text = val.toString();
                                  }),
                              validator: (value) =>
                              value == null
                                  ? 'please_fill_in_the_category'.tr : null,
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 5.0),
                          child: Material(
                            elevation: 5.0,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(32.0),
                            child: MaterialButton(
                              child: Text(
                                'submit'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    showLoadingSpinner = true;
                                  });
                                  if(isAdopted == true){
                                    addAdoption(categoryController.text,
                                        biographyController.text,
                                        int.parse(goalAmountController.text).toDouble(),
                                        nameController.text,
                                        endDateController.text);
                                  }
                                  else{
                                    addBeneficiary(categoryController.text,
                                        biographyController.text,
                                        int.parse(goalAmountController.text).toDouble(),
                                        nameController.text,
                                        endDateController.text);
                                  }

                                  Navigator.of(context).popUntil(ModalRoute.withName(OrganizationDashboard.id));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar( SnackBar(content: Text('beneficiary_created!'.tr)));
                                }
                              },
                            ),
                          ),
                        ),

                      ]),
                )
            )
        )
    );
  }
}