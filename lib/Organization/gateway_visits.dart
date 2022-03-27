import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donaid/Models/GatewayVisit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Models/Beneficiary.dart';
import '../Models/Campaign.dart';
import '../Models/Donation.dart';
import '../Models/Donor.dart';
import '../Models/UrgentCase.dart';
import 'OrganizationWidget/organization_bottom_navigation.dart';
import 'OrganizationWidget/organization_drawer.dart';

class GatewayVisits extends StatefulWidget {
  static const id = 'gateway_visits';
  const GatewayVisits({Key? key}) : super(key: key);

  @override
  _GatewayVisitsState createState() => _GatewayVisitsState();
}

class _GatewayVisitsState extends State<GatewayVisits> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final donationRegex = RegExp("^\$|^(0|([1-9][0-9]{0,3}))(\\.[0-9]{0,2})?\$");

  String donationAmount = "";
  List<GatewayVisit> visits = [];
  List<Donor> donors = [];

  @override
  void initState() {
    super.initState();
    _getGatewayVisits();
  }

  _refreshPage() {
    visits.clear();
    donors.clear();
    _getGatewayVisits();
  }

  _getGatewayVisits() async {
    var ret = await _firestore
        .collection('GatewayVisits')
        .where('organizationID', isEqualTo: _auth.currentUser!.uid)
        .where('read', isEqualTo: false)
        .get();

    for (var doc in ret.docs) {
      GatewayVisit visit = GatewayVisit(
          charityType: doc.data()['charityType'],
          charityTitle: doc.data()['charityTitle'],
          donorID: doc.data()['donorID'],
          organizationID: doc.data()['organizationID'],
          id: doc.data()['id'],
          visitedAt: doc.data()['visitedAt'],
          charityID: doc.data()['charityID']);

      visits.add(visit);
    }
    visits.sort((a, b) => a.visitedAt.compareTo(b.visitedAt));

    _getDonors();
  }

  _getDonors() async {
    for (var visit in visits) {
      var ret = await _firestore
          .collection('DonorUsers')
          .where('uid', isEqualTo: visit.donorID)
          .get();

      var doc = ret.docs.first;
      Donor donor = Donor(
        email: doc.data()['email'],
        firstName: doc.data()['firstName'],
        lastName: doc.data()['lastName'],
        phoneNumber: doc.data()['phoneNumber'],
        id: doc.data()['id'],
      );
      donors.add(donor);
    }
    setState(() {});
  }

  _markAsRead(GatewayVisit visit) async {
    await _firestore.collection('GatewayVisits').doc(visit.id).set({
      'organizationID': visit.organizationID,
      'donorID': visit.donorID,
      'visitedAt': visit.visitedAt,
      'id': visit.id,
      'charityType': visit.charityType,
      'charityTitle': visit.charityTitle,
      'charityID': visit.charityID,
      'read': true
    });
    _refreshPage();
  }

  _updateCharityAndCreateDonationRecord(GatewayVisit visit) async {
    if (visit.charityType == 'Campaign') {
      var ret = await _firestore
          .collection('Campaigns')
          .where('id', isEqualTo: visit.charityID)
          .get();
      var doc = ret.docs.first;
      Campaign campaign = Campaign(
        active: doc.data()['active'],
        amountRaised: doc.data()['amountRaised'].toDouble(),
        category: doc.data()['category'],
        dateCreated: doc.data()['dateCreated'],
        description: doc.data()['description'],
        endDate: doc.data()['endDate'],
        goalAmount: doc.data()['goalAmount'].toDouble(),
        id: doc.data()['id'],
        organizationID: doc.data()['organizationID'],
        title: doc.data()['title'],
      );

      campaign.amountRaised += double.parse(donationAmount);

      await _firestore.collection('Campaigns').doc(campaign.id).set({
        'active': campaign.active,
        'amountRaised': campaign.amountRaised,
        'category': campaign.category,
        'dateCreated': campaign.dateCreated,
        'description': campaign.description,
        'endDate': campaign.endDate,
        'goalAmount': campaign.goalAmount,
        'id': campaign.id,
        'organizationID': campaign.organizationID,
        'title': campaign.title
      });

      var docRef = await _firestore.collection('Donations').add({});
      await _firestore.collection('Donations').doc(docRef.id).set({
        'category': campaign.category,
        'charityID': campaign.id,
        'charityName': campaign.title,
        'charityType': 'Campaigns',
        'donatedAt': visit.visitedAt,
        'donationAmount': donationAmount,
        'donorID': visit.donorID,
        'organizationID': visit.organizationID,
        'id': docRef.id
      });
    } else if (visit.charityType == 'Beneficiary') {
      var ret = await _firestore
          .collection('Beneficiaries')
          .where('id', isEqualTo: visit.charityID)
          .get();
      var doc = ret.docs.first;
      Beneficiary beneficiary = Beneficiary(
        active: doc.data()['active'],
        amountRaised: doc.data()['amountRaised'].toDouble(),
        category: doc.data()['category'],
        dateCreated: doc.data()['dateCreated'],
        biography: doc.data()['biography'],
        endDate: doc.data()['endDate'],
        goalAmount: doc.data()['goalAmount'].toDouble(),
        id: doc.data()['id'],
        organizationID: doc.data()['organizationID'],
        name: doc.data()['name'],
      );

      beneficiary.amountRaised += double.parse(donationAmount);

      await _firestore.collection('Beneficiaries').doc(beneficiary.id).set({
        'active': beneficiary.active,
        'amountRaised': beneficiary.amountRaised,
        'category': beneficiary.category,
        'dateCreated': beneficiary.dateCreated,
        'biography': beneficiary.biography,
        'endDate': beneficiary.endDate,
        'goalAmount': beneficiary.goalAmount,
        'id': beneficiary.id,
        'organizationID': beneficiary.organizationID,
        'name': beneficiary.name
      });

      var docRef = await _firestore.collection('Donations').add({});
      await _firestore.collection('Donations').doc(docRef.id).set({
        'category': beneficiary.category,
        'charityID': beneficiary.id,
        'charityName': beneficiary.name,
        'charityType': 'Beneficiaries',
        'donatedAt': visit.visitedAt,
        'donationAmount': donationAmount,
        'donorID': visit.donorID,
        'organizationID': visit.organizationID,
        'id': docRef.id
      });
    } else if (visit.charityType == 'Urgent Case') {
      var ret = await _firestore
          .collection('UrgentCases')
          .where('id', isEqualTo: visit.charityID)
          .get();
      var doc = ret.docs.first;
      UrgentCase urgentCase = UrgentCase(
          active: doc.data()['active'],
          amountRaised: doc.data()['amountRaised'].toDouble(),
          category: doc.data()['category'],
          dateCreated: doc.data()['dateCreated'],
          description: doc.data()['description'],
          endDate: doc.data()['endDate'],
          goalAmount: doc.data()['goalAmount'].toDouble(),
          id: doc.data()['id'],
          organizationID: doc.data()['organizationID'],
          title: doc.data()['title'],
          approved: doc.data()['approved']);

      urgentCase.amountRaised += double.parse(donationAmount);

      await _firestore.collection('UrgentCases').doc(urgentCase.id).set({
        'active': urgentCase.active,
        'amountRaised': urgentCase.amountRaised,
        'category': urgentCase.category,
        'dateCreated': urgentCase.dateCreated,
        'description': urgentCase.description,
        'endDate': urgentCase.endDate,
        'goalAmount': urgentCase.goalAmount,
        'id': urgentCase.id,
        'organizationID': urgentCase.organizationID,
        'title': urgentCase.title,
        'approved': urgentCase.approved
      });

      var docRef = await _firestore.collection('Donations').add({});
      await _firestore.collection('Donations').doc(docRef.id).set({
        'category': urgentCase.category,
        'charityID': urgentCase.id,
        'charityName': urgentCase.title,
        'charityType': 'UrgentCases',
        'donatedAt': visit.visitedAt,
        'donationAmount': donationAmount,
        'donorID': visit.donorID,
        'organizationID': visit.organizationID,
        'id': docRef.id
      });
    } else {
      return;
    }
  }

  Future<void> confirmNoDonation(GatewayVisit visit) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text('are_you_sure?'.tr),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            content: Text(
                'Please confirm that this visit to your gateway did not result in a donation.'.tr),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _markAsRead(visit);
                      Navigator.pop(context);
                    },
                    child: Text('ok'.tr),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancel'.tr),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Future<void> confirmDonation(GatewayVisit visit) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text('Confirm Donation'.tr),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Please enter the amount that was donated.'.tr),
              SizedBox(
                height: 12,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    donationAmount = value.toString();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please_enter_a_valid_payment_amount'.tr;
                    } else if (double.parse(value) < 0.50) {
                      return 'please_provide_a_donation_minimum'.tr;
                    } else {
                      return null;
                    }
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      label: Center(
                        child: RichText(
                            text: TextSpan(
                          text: 'donation_amount'.tr,
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 20.0),
                        )),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      )),
                ),
              ),
            ]),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _updateCharityAndCreateDonationRecord(visit);
                        _markAsRead(visit);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('ok'.tr),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancel'.tr),
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gateway Visits'.tr),
        backgroundColor: Colors.blue,
      ),
      drawer: const OrganizationDrawer(),
      body: _body(),
      bottomNavigationBar: const OrganizationBottomNavigation(),
    );
  }

  _body() {
    return visits.isNotEmpty
        ? RefreshIndicator(
            onRefresh: () async {
              _refreshPage();
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Did this visit result in a donation?'.tr,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListView.builder(
                    itemCount: visits.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                                '${donors[index].firstName} ${donors[index].lastName.substring(0, 1)}. - ${visits[index].charityTitle}\n(${visits[index].charityType})'),
                            subtitle: Text(DateFormat('yyyy-MM-dd')
                                .format(visits[index].visitedAt.toDate())),
                            trailing: Wrap(
                              spacing: 12,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      confirmDonation(visits[index]);
                                    },
                                    icon: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 40,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      confirmNoDonation(visits[index]);
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                      size: 40,
                                    ))
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          )
                        ],
                      );
                    })
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No new visits'.tr,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
  }
}
