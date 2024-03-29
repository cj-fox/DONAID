import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donaid/Organization/OrganizationWidget/organization_bottom_navigation.dart';
import 'package:donaid/Organization/OrganizationWidget/organization_drawer.dart';
import 'package:donaid/Organization/organization_urgentcase_full.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/PushNotification.dart';
import '../Models/UrgentCase.dart';
import '../Services/notifications.dart';


class OrganizationNotificationPage extends StatefulWidget {
  static const id = 'org_notification_page';
  const OrganizationNotificationPage({Key? key}) : super(key: key);

  @override
  _OrganizationNotificationPageState createState() => _OrganizationNotificationPageState();
}

class _OrganizationNotificationPageState extends State<OrganizationNotificationPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var deletedNotification;
  var deletedIndex;
  List<PushNotification> notifications=[];

  @override
  void initState(){
    super.initState();
    _getNotifications();
  }

  _goToChosenUrgentCase(String id)async{
    //This method allows organization users to navigate to the full details page for the urgent case that they got a notification for
    var ret = await _firestore.collection('UrgentCases').where('id',isEqualTo: id).get();
    var doc = ret.docs[0];
    UrgentCase urgentCase = UrgentCase(
        title: doc.data()['title'],
        description: doc.data()['description'],
        goalAmount: doc.data()['goalAmount'].toDouble(),
        amountRaised: doc.data()['amountRaised'].toDouble(),
        category: doc.data()['category'],
        endDate: doc.data()['endDate'],
        dateCreated: doc.data()['dateCreated'],
        id: doc.data()['id'],
        organizationID: doc.data()['organizationID'],
        active: doc.data()['active'],
        rejected: doc.data()['rejected'],
        approved: doc.data()['approved']
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return (OrganizationUrgentCaseFullScreen(urgentCase));
    }));
  }

  _getNotifications() async {
    //This method gets the notifications for the logged in organization from Firestore
    var notificationsDoc = await _firestore.collection('Notifications').doc(_auth.currentUser?.uid).get();

    for(var item in notificationsDoc['notificationsList']){
      PushNotification notification = PushNotification(
          item['notificationTitle'],
          item['notificationBody'],
          item['dataTitle'],
          item['dataBody']
      );

      notifications.add(notification);
    }
    setState(() {
      notifications = notifications.reversed.toList();
    });


  }

  _body(){
    //Create list view for notifications
    return ListView.builder(
        itemCount: notifications.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, int index) {
          return Column(
            children: [
              Dismissible(
                key: UniqueKey(),
                onDismissed: (direction){
                  deletedIndex = index;
                  deletedNotification = notifications[index];

                  deleteNotification(_auth.currentUser?.uid, notifications[index]);
                  notifications.removeAt(index);
                  setState(() {});

                  //After a notification has been deleted, show the snackbar for 5 seconds that allows the user to UNDO the deletion
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Notification deleted.'),
                        duration: Duration(seconds:3),
                        action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () async{
                              undoDeleteNotification(_auth.currentUser?.uid, deletedNotification);
                              setState(() {
                                notifications.insert(deletedIndex, deletedNotification);
                              });

                            }),
                      ));
                },
                child: GestureDetector(
                  onTap: (){
                    //If the notification has the dataTitle 'UrgentCaseApprovals' then navigate to the urgent
                    //case full details page on tap. This check was implemented to allow for other types of notifications
                    //in the future
                    if(notifications[index].dataTitle.toString() == 'UrgentCaseApprovals'){
                      _goToChosenUrgentCase(notifications[index].dataBody.toString());
                    }
                  },
                  child: ListTile(
                    title: Text(notifications[index].title.toString()),
                    subtitle: Text(notifications[index].body.toString(),
                  ),),
                ),
              ),
              SizedBox(height:10)
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: _body(),
      drawer: const OrganizationDrawer(),
      bottomNavigationBar: const OrganizationBottomNavigation(),
    );
  }
}
