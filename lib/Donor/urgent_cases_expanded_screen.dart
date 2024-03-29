import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donaid/Donor/DonorAlertDialog/DonorAlertDialogs.dart';
import 'package:donaid/Donor/urgent_case_donate_screen.dart';
import 'package:donaid/Models/Organization.dart';
import 'package:donaid/Models/UrgentCase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'DonorWidgets/donor_bottom_navigation_bar.dart';
import 'DonorWidgets/donor_drawer.dart';
import 'package:get/get.dart';

class UrgentCasesExpandedScreen extends StatefulWidget {
  static const id = 'urgent_cases_expanded_screen';
  const UrgentCasesExpandedScreen({Key? key})
      : super(key: key);

  @override
  _UrgentCasesExpandedScreenState createState() =>
      _UrgentCasesExpandedScreenState();
}

class _UrgentCasesExpandedScreenState extends State<UrgentCasesExpandedScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  List<UrgentCase> urgentCases = [];
  List<Organization> organizations=[];
  var f = NumberFormat("###,##0.00", "en_US");

  @override
  void initState() {
    super.initState();
    _getUrgentCases();
  }

  _refreshPage(){
    urgentCases.clear();
    _getUrgentCases();
    setState(() {

    });
  }

  _getUrgentCases() async {
    //Get all urgent cases that are active and have been approved by the admin
    var ret = await _firestore.collection('UrgentCases')
        .where('approved',isEqualTo: true)
        .where('active', isEqualTo: true)
        .where('endDate',isGreaterThanOrEqualTo: Timestamp.now())
        .orderBy('endDate',descending: false)
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
          rejected: element.data()['rejected'],
          approved: element.data()['approved']
      );
      urgentCases.add(urgentCase);
    }
    setState(() {});
    _getUrgentCaseOrganizations();
  }

  _getUrgentCaseOrganizations() async{
    //Get organization that corresponds for each urgent case so that we can check
    // if the organization is based in the US or not
    for(var urgentCase in urgentCases){
      var ret = await _firestore.collection('OrganizationUsers')
          .where('uid', isEqualTo: urgentCase.organizationID)
          .get();

      for(var element in ret.docs){
        Organization organization = Organization(
          organizationName: element.data()['organizationName'],
          uid: element.data()['uid'],
          organizationDescription: element.data()['organizationDescription'],
          country: element.data()['country'],
          gatewayLink: element.data()['gatewayLink'],
        );
        organizations.add(organization);
      }
    }
  }

  _urgentCasesBody() {
    return urgentCases.isNotEmpty
    ? ListView.builder(
        itemCount: urgentCases.length,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    if(organizations[index].country =='United States'){
                      //If organization for urgent case is based in the US, navigate to urgent case donation screen
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return (UrgentCaseDonateScreen(urgentCases[index]));
                      })).then((value) => _refreshPage());
                    }
                    else{
                      //If organization for urgent case is foreign, show payment gateway link popup

                      //Charity object is used to create payment gateway visit record if the donor user clicks
                      // on the payment gateway link
                      Map<String, dynamic> charity = {
                        'charityID':urgentCases[index].id,
                        'charityType':'Urgent Case',
                        'charityTitle':urgentCases[index].title
                      };
                      DonorAlertDialogs.paymentLinkPopUp(context, organizations[index], _auth.currentUser!.uid,charity);
                    }
                  },
                  title: Text(urgentCases[index].title),
                  subtitle: Text(urgentCases[index].description),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text('\$'+f.format(urgentCases[index].amountRaised),
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.black, fontSize: 15)),
                        Text(
                          '\$'+f.format(urgentCases[index].goalAmount),
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ]),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.green),
                          value: (urgentCases[index].amountRaised/urgentCases[index].goalAmount),
                          minHeight: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:10)
              ],
            ),
          );
        })
    :  Center(child: Text('no_active_urgent_sases_show'.tr, style: TextStyle(fontSize: 18),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('urgent_cases'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const DonorDrawer(),
      body: _urgentCasesBody(),
      bottomNavigationBar: DonorBottomNavigationBar(),
    );
  }
}
