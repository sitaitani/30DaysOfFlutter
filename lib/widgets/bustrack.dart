import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';

//import '../Models/Notification.dart';

class bustrack extends StatefulWidget {
  @override
  State<bustrack> createState() => _BustrackState();
}

class _BustrackState extends State<bustrack> {
  List<bustrack> bustrackmap = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bus Tracking"),
        ),
        body: Center(child: Container( color: Colors.white, child: EmptyWidget("Coming Soon", "Bus tracking feature is coming soon", "comingSoon.jpg"))));
  }
}
