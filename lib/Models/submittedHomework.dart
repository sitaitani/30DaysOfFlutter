//import 'dart:html';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:uuid/uuid.dart';

import '../utils/NotificationAPI.dart';

//import '../Models/Notification.dart';

class submittedHomework extends StatefulWidget {
  const submittedHomework({Key? key, required this.submittedHomeworkData}) : super(key: key);

    final HomeworkSubmitData? submittedHomeworkData;



  @override
  State<submittedHomework> createState() => _submittedHomeworkState();
}

class _submittedHomeworkState extends State<submittedHomework> {
  get stack => null;

  var isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.submittedHomeworkData?.studentName ?? ""),
      ),
      body: Stack(
        children: <Widget>[
          // ignore: avoid_unnecessary_containers
          Container(
              child:
              SfPdfViewer.network(widget.submittedHomeworkData?.fileName ?? "")),
                  
        ],
      ),
    );
  }

}
