import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donaid/Models/Donation.dart';
import 'package:donaid/Models/Organization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'DonorWidgets/donor_bottom_navigation_bar.dart';
import 'DonorWidgets/donor_drawer.dart';
import 'package:intl/intl.dart';

class DonationHistory extends StatefulWidget {
  static const id = 'donation_history';
  const DonationHistory({Key? key}) : super(key: key);

  @override
  _DonationHistoryState createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  List<Donation> donations = [];
  List<Organization> organizations = [];
  var f = NumberFormat("###,###.0#", "en_US");

  @override
  void initState() {
    super.initState();
    _getdonationHistory();
  }

  _getdonationHistory() async {
    var ret = await _firestore
        .collection('Donations')
        .where('donorID', isEqualTo: _auth.currentUser?.uid)
        .get();

    for (var doc in ret.docs) {
      Donation donation = Donation(
          charityID: doc.data()['charityID'],
          charityName: doc.data()['charityName'],
          donatedAt: doc.data()['donatedAt'],
          donationAmount: double.parse(doc.data()['donationAmount']),
          donorID: doc.data()['donorID'],
          organizationID: doc.data()['organizationID'],
          id: doc.data()['id'],
          category: doc.data()['category'],
          charityType: doc.data()['charityType']);

      donations.add(donation);
    }
    _getDonationOrganizations();
  }

  _getDonationOrganizations() async {
    for (var donation in donations) {
      var ret = await _firestore
          .collection('OrganizationUsers')
          .where('uid', isEqualTo: donation.organizationID)
          .get();
      var doc = ret.docs.first;

      Organization organization = Organization(
        organizationName: doc.data()['organizationName'],
        uid: doc.data()['uid'],
        organizationDescription: doc.data()['organizationDescription'],
        country: doc.data()['country'],
        gatewayLink: doc.data()['gatewayLink'],
      );

      organizations.add(organization);
    }
    setState(() {});
  }

  _donationHistoryBody() {
    return ListView.builder(
        itemCount: donations.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Card(
              child: Column(
            children: [
              (donations[index].charityType == 'UrgentCases')
                  ? ListTile(
                      onTap: () {
                        //TODO: Implement on Tap
                      },
                      title: Text(donations[index].charityName),
                      subtitle: Text('Urgent Case\n' +
                          organizations[index].organizationName),
                      trailing: Text(
                          "\u0024" + f.format(donations[index].donationAmount)),
                    )
                  : (donations[index].charityType == 'Campaigns')
                      ? ListTile(
                          onTap: () {
                            //TODO: Implement on Tap
                          },
                          title: Text(donations[index].charityName),
                          subtitle: Text('Campaign\n' +
                              organizations[index].organizationName),
                          trailing: Text("\u0024" +
                              f.format(donations[index].donationAmount)),
                        )
                      : ListTile(
                onTap: () {
                  //TODO: Implement on Tap
                },
                title: Text(donations[index].charityName),
                subtitle: Text('Beneficiary\n' +
                    organizations[index].organizationName),
                trailing: Text("\u0024" +
                    f.format(donations[index].donationAmount)),
              ),
              const Divider()
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const DonorDrawer(),
      body: _donationHistoryBody(),
      bottomNavigationBar: DonorBottomNavigationBar(),
    );
  }
}
