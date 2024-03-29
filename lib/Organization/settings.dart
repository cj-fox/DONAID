import 'package:donaid/Organization/OrganizationWidget/organization_bottom_navigation.dart';
import 'package:donaid/Organization/OrganizationWidget/organization_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizationSettingsPage extends StatefulWidget {
  static const id = 'organization_settings_page';
  const OrganizationSettingsPage({Key? key}) : super(key: key);

  @override
  _OrganizationSettingsPageState createState() => _OrganizationSettingsPageState();
}

class _OrganizationSettingsPageState extends State<OrganizationSettingsPage> {
  final _prefs = SharedPreferences.getInstance();
  final _auth = FirebaseAuth.instance;
  bool urgentCaseApprovalsNotifications=false;
  @override
  void initState(){
    super.initState();
    _getSharedPreferences();
  }

  _getSharedPreferences()async{
    /*The SharedPreferences is a small amount of data that we can store directly on the device
    * In this instance, it is being used to store whether or not the user is enrolled in receiving notifications
    * for when urgent cases are approved. The Firebase Messaging topic that organizations are enrolled to is different from the topic
    * that donor users get subscribed to. Organizations are subscribed to a topic that is unique for their organization so that
    * the organization user can receive notifications for both urgent case approvals and denials for the urgent cases that they have
    * submitted*/
    final prefs = await _prefs;
    urgentCaseApprovalsNotifications = prefs.getBool('organizationUrgentCaseApprovalsNotifications')!;

    setState(() {

    });
  }

  _body(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('notifications'.tr, style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('urgent_case_approvals'.tr, style: TextStyle(fontSize: 16),),
                  AnimatedContainer(duration: Duration(milliseconds: 500),height: 40, width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: urgentCaseApprovalsNotifications ? Colors.greenAccent[100] : Colors.redAccent[100]?.withOpacity(0.5)
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          top: 3.0,
                          left: urgentCaseApprovalsNotifications ? 60.0: 0.0,
                          right: urgentCaseApprovalsNotifications ? 0.0 : 60.0,
                          child: InkWell(
                            onTap: toggleButton,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              transitionBuilder: (Widget child, Animation<double> animation){
                                return RotationTransition(child: child, turns: animation,);
                              },
                              child: urgentCaseApprovalsNotifications ? Icon(Icons.check_circle, color: Colors.green, size: 35, key: UniqueKey(),)
                                  : Icon(Icons.remove_circle_outline, color: Colors.red, size: 35, key: UniqueKey(),),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(thickness: 2,color: Colors.blue,),
          ],
        ),
      ),
    );
  }

  toggleButton()async{
    /*Toggle the boolean value that indicates whether or not the user is enrolled for notifications
    * Based on the new value, either enroll or unenroll the user from notifications*/
    setState(() {
      urgentCaseApprovalsNotifications = !urgentCaseApprovalsNotifications;
    });

    final prefs = await _prefs;
    prefs.setBool('organizationUrgentCaseApprovalsNotifications', urgentCaseApprovalsNotifications);

    if(urgentCaseApprovalsNotifications){
      FirebaseMessaging.instance.subscribeToTopic(_auth.currentUser!.uid.toString()+'Approvals');
      print('Subscribed:' + _auth.currentUser!.uid.toString()+'Approvals');
    }
    else{
      FirebaseMessaging.instance.unsubscribeFromTopic(_auth.currentUser!.uid.toString()+'Approvals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const OrganizationDrawer(),
      body:_body() ,
      bottomNavigationBar: OrganizationBottomNavigation(),
    );
  }
}
