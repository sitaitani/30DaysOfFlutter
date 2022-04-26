import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';

//import '../Models/Notification.dart';

class homeworkdetail extends StatefulWidget {
  @override
  State<homeworkdetail> createState() => _HomeworkdetailState();
}

class _HomeworkdetailState extends State<homeworkdetail> {
  List<HomeworkData> homeworklist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Homework Detail"),
        ),
        body: Text("Detail"));
  }
}
