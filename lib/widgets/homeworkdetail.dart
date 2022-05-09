//import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//import '../Models/Notification.dart';

class homeworkdetail extends StatefulWidget {
  const homeworkdetail({Key? key, required this.fileName}) : super(key: key);

  final String fileName;

  @override
  State<homeworkdetail> createState() => _HomeworkdetailState();
}

class _HomeworkdetailState extends State<homeworkdetail> {
  get stack => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // ignore: avoid_unnecessary_containers
          Container(
              child:
                  SfPdfViewer.asset('assets/pdf/' + widget.fileName + '.pdf')),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 103, 72, 109),
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      Future getPdfAndUpload(int position) async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf', 'doc'],
                        );
                      }
                    },

                    // },
                    child: const Text(
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
