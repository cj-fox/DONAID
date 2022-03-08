import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donaid/Models/Beneficiary.dart';
import 'package:donaid/Models/Campaign.dart';
import 'package:donaid/Models/UrgentCase.dart';
import 'package:donaid/Organization/OrganizationWidget/organization_bottom_navigation.dart';
import 'package:donaid/Organization/OrganizationWidget/organization_drawer.dart';
import 'package:donaid/Organization/organization_beneficiary_full.dart';
import 'package:donaid/Organization/organization_campaign_full.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'organization_urgentcase_full.dart';

class InactiveCharitiesScreen extends StatefulWidget {
  const InactiveCharitiesScreen({Key? key}) : super(key: key);

  @override
  _InactiveCharitiesScreenState createState() => _InactiveCharitiesScreenState();
}

class _InactiveCharitiesScreenState extends State<InactiveCharitiesScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  List<Beneficiary> beneficiaries=[];
  List<Campaign> campaigns=[];
  List<UrgentCase> urgentCases=[];

  @override
  void initState() {
    super.initState();
    _getExpiredCampaigns();
    _getExpiredBeneficiaries();
    _getExpiredUrgentCases();
  }

  _refreshPage(){
    beneficiaries.clear();
    campaigns.clear();
    beneficiaries.clear();
    _getExpiredCampaigns();
    _getExpiredBeneficiaries();
    _getExpiredUrgentCases();
  }

  _getExpiredBeneficiaries() async {
    var ret = await _firestore.collection('Beneficiaries')
        .where('organizationID', isEqualTo: _auth.currentUser?.uid)
        .where('active', isEqualTo: false)
        .where('endDate',isGreaterThanOrEqualTo: Timestamp.now())
        .orderBy('endDate',descending: false)
        .get();


    for (var element in ret.docs) {
      Beneficiary beneficiary = Beneficiary(
        name: element.data()['name'],
        biography: element.data()['biography'],
        goalAmount: element.data()['goalAmount'].toDouble(),
        amountRaised: element.data()['amountRaised'].toDouble(),
        category: element.data()['category'],
        endDate: element.data()['endDate'],
        dateCreated: element.data()['dateCreated'],
        id: element.data()['id'],
        organizationID: element.data()['organizationID'],
        active: element.data()['active'],
      );
      beneficiaries.add(beneficiary);
    }

    setState(() {});
  }

  _getExpiredCampaigns()async{
    var ret = await _firestore.collection('Campaigns')
        .where('organizationID',isEqualTo: _auth.currentUser?.uid)
        .where('active', isEqualTo: false)
        .where('endDate',isGreaterThanOrEqualTo: Timestamp.now())
        .orderBy('endDate',descending: false)
        .get();

    for (var element in ret.docs) {
      Campaign campaign = Campaign(
        title: element.data()['title'],
        description: element.data()['description'],
        goalAmount: element.data()['goalAmount'].toDouble(),
        amountRaised: element.data()['amountRaised'].toDouble(),
        category: element.data()['category'],
        endDate: element.data()['endDate'],
        dateCreated: element.data()['dateCreated'],
        id: element.data()['id'],
        organizationID: element.data()['organizationID'],
        active: element.data()['active'],
      );
      campaigns.add(campaign);
    }
    setState(() {});
  }

  _getExpiredUrgentCases() async {
    var ret = await _firestore
        .collection('UrgentCases')
        .where('organizationID', isEqualTo: _auth.currentUser?.uid)
        .where('endDate',isGreaterThanOrEqualTo: Timestamp.now())
        .where('active', isEqualTo: false)
        .where('approved',isEqualTo: true)
        .orderBy('endDate', descending: false)
        .get();

    for (var element in ret.docs) {
      UrgentCase urgentCase = UrgentCase(
          title: element.data()['title'],
          description: element.data()['description'],
          goalAmount: element.data()['goalAmount'].toDouble(),
          amountRaised: element.data()['amountRaised'].toDouble(),
          category: element.data()['category'],
          endDate: element.data()['endDate'],
          dateCreated: element.data()['dateCreated'],
          id: element.data()['id'],
          organizationID: element.data()['organizationID'],
          active: element.data()['active'],
          approved: element.data()['approved']
      );
      urgentCases.add(urgentCase);
    }

    setState(() {});
  }

  _beneficiariesBody(){
    return ListView.builder(
        itemCount: beneficiaries.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OrganizationBeneficiaryFullScreen(beneficiaries[index]);
                    })).then((value) => _refreshPage());
                  },
                  title: Text(beneficiaries[index].name),
                  subtitle: Text(beneficiaries[index].biography),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('\$${(beneficiaries[index].amountRaised.toStringAsFixed(2))}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.black, fontSize: 15)),
                  Text(
                    '\$${beneficiaries[index].goalAmount.toStringAsFixed(2)}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ]),
                LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                  value: (beneficiaries[index].amountRaised/beneficiaries[index].goalAmount),
                  minHeight: 10,
                ),
                const Divider()
              ],
            ),
          );
        });
  }

  _campaignsBody(){
    return ListView.builder(
        itemCount: campaigns.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OrganizationCampaignFullScreen(campaigns[index]);
                    })).then((value) => _refreshPage());
                  },
                  title: Text(campaigns[index].title),
                  subtitle: Text(campaigns[index].description),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('\$${(campaigns[index].amountRaised.toStringAsFixed(2))}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.black, fontSize: 15)),
                  Text(
                    '\$${campaigns[index].goalAmount.toStringAsFixed(2)}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ]),
                LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                  value: (campaigns[index].amountRaised/campaigns[index].goalAmount),
                  minHeight: 10,
                ),
                const Divider()
              ],
            ),
          );
        });
  }

  _urgentCasesBody(){
    return ListView.builder(
        itemCount: urgentCases.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OrganizationUrgentCaseFullScreen(urgentCases[index]);
                    })).then((value) => _refreshPage());
                  },
                  title: Text(urgentCases[index].title),
                  subtitle: Text(urgentCases[index].description),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('\$${(urgentCases[index].amountRaised.toStringAsFixed(2))}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.black, fontSize: 15)),
                  Text(
                    '\$${urgentCases[index].goalAmount.toStringAsFixed(2)}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ]),
                LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                  value: (urgentCases[index].amountRaised/urgentCases[index].goalAmount),
                  minHeight: 10,
                ),
                const Divider()
              ],
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [Tab(text: 'Campaigns',), Tab(text: 'Beneficiaries',), Tab(text: 'Urgent Cases',)],),
          title: const Text('Inactive Charities'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        drawer: const OrganizationDrawer(),
        body: TabBarView(
          children: [
            _campaignsBody(),
            _beneficiariesBody(),
            _urgentCasesBody()
          ],
        ),
        bottomNavigationBar: const OrganizationBottomNavigation(),
      ),
    );
  }
}