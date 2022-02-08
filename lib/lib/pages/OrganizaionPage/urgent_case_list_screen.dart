import 'package:donaid/pages/OrganizaionPage/urgent_case_form.dart';
import 'package:donaid/pages/home_screen.dart';
import 'package:flutter/material.dart';
///Author: Raisa Zaman
class UrgentList extends StatefulWidget {
  static const id = 'urgent_case_list_screen';
  const UrgentList({Key? key}) : super(key: key);

  @override
  _UrgentList createState() => _UrgentList();
}

class _UrgentList extends State<UrgentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DONAID'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add, size: 30,), onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UrgentForm()),
            );}),
        ],
      ),
        backgroundColor: Colors.white.withAlpha(55),
        body: Stack(
            children: [
              ListView(
                  children:<Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20,0,0),
                        child: Text('My Urgent Cases', style: TextStyle(fontSize: 20,
                            color: Colors.white))
                    )
                  ]
              )
            ]
        )
    );
  }
}