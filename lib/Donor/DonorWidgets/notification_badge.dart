import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int totalNotification;
  const NotificationBadge({Key? key, required this.totalNotification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("$totalNotification", style: TextStyle(
            color: Colors.white, fontSize: 20
          ),)
        ),
      ),
    );
  }
}
