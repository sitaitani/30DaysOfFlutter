//import 'dart:html';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';
import 'package:flutter_application_2/widgets/homework.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:uuid/uuid.dart';

import '../Models/User.dart';
import '../utils/NotificationAPI.dart';

//import '../Models/Notification.dart';

class homeworkdetail extends StatefulWidget {
  const homeworkdetail({Key? key, required this.homework}) : super(key: key);

  final HomeworkData homework;
  // final String fileName;



  @override
  State<homeworkdetail> createState() => _HomeworkdetailState();
}

class _HomeworkdetailState extends State<homeworkdetail> {
  get stack => null;

  var isLoading = false;

    String? fileName;

  PlatformFile? file;

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
      body: Stack(
        children: <Widget>[
          // ignore: avoid_unnecessary_containers
          
          Container(
              child:
              SfPdfViewer.network(widget.homework.fileName)),
                  
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

                      isDeadlinedPassed(
                                                  widget.homework
                                                      .deadline) ==
                                              "passed" ?
          ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Deadline is passesd. Cannot submit')),
    )
                                              :

                      getPdfAndUpload(1);
                    },

                    // },
                    child: 
                    isLoading ?
                    Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,

                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                                const Text(
                                                  'Submitting...',
                                                  style:
                                                      TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                    height: 20,
                                                    width: 20,
                                                    child:
                                                        const CircularProgressIndicator(
                                                      color: Colors.white,
                                                    )),
                                              ]) :

                    const Text(
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

          //isLoading ? Center(child: CircularProgressIndicator()) : Text(""),
        ],
      ),
    );
  }

  Future getPdfAndUpload(int position) async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );
                          file = result?.files?.first;
                          uploadFile();
                      }



  void uploadFile() async {
    setState(() {
      isLoading = true;
    });

    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef =
        storageRef.child(DateTime.now().millisecondsSinceEpoch.toString());

    var fileData = File(file!.path!);

    await mountainsRef.putFile(fileData);
    final url = await mountainsRef.getDownloadURL();

    final homework = HomeworkSubmitData(
        Uuid().v1(),
        url,
        widget.homework.assignmentId,
        "",
        "",
        "",
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        userInformation.name,
);

    HomeworkSubmitAPI().save(homework);
    

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Successfully uploaded your homework.')),
    );

    Navigator.of(context).pop();
  }

  String isDeadlinedPassed(String deadlineDate) {
    final deadlinedDate = DateTime.parse(deadlineDate);

    final currentDate = DateTime.now();

    print(deadlinedDate);
    print(currentDate);
    if (deadlinedDate.isSameDate(currentDate)) {
      return "same";
    } else if (deadlinedDate.compareTo(currentDate) <= 0) {
      return "passed";
    }
    return "none";
  }
}
