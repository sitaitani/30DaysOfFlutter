import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/Models/Notification.dart';
import 'package:flutter_application_2/utils/FCMAPI.dart';
import 'package:flutter_application_2/utils/NotificationAPI.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class teacherhomeworkprovide extends StatefulWidget {
  const teacherhomeworkprovide(
      {Key? key, required this.teacherId, required this.subjectId})
      : super(key: key);

  final String teacherId;

  final String subjectId;

  @override
  _teacherhomeworkprovideState createState() => _teacherhomeworkprovideState();
}

class _teacherhomeworkprovideState extends State<teacherhomeworkprovide> {
  String? errorMessage;

  var isLoading = false;

  get changeButon => null;

  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;

  String? fileName;

  PlatformFile? file;

  final TextEditingController titleController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var DetailEditingController;
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
            ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Upload New Assignment"),
            elevation: 0,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  //top: MediaQuery.of(context).size.height * 0.20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: TextFormField(
                                controller: titleController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please Enter Title");
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Title",
                                    hintStyle: TextStyle(color: Colors.teal),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              minLines: 5,
                              maxLines: 6,
                              style: TextStyle(color: Colors.black),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return ("Please Enter Description");
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Description (Optional)",
                                  hintStyle: TextStyle(color: Colors.teal),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Container(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    side: BorderSide(
                                        width: 1, color: Colors.black12)),
                                onPressed: () async {
                                  final date = DateTime.now();
                                  final pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(
                                          date.year, date.month + 1, date.day));

                                  if (pickedDate != null) {
                                    setState(() {
                                      selectedDate = pickedDate;
                                    });
                                  }
                                },
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                        child: Text(
                                            (selectedDate == null)
                                                ? 'Select Deadline'
                                                : "Deadline: " +
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(selectedDate!),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color:
                                                    Colors.black))), // <-- Text

                                    Icon(
                                      // <-- Icon
                                      Icons.calendar_month,
                                      size: 24.0,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            /// Button
                            Row(
                              children: [
                                Text(
                                  "File:",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      side: BorderSide(
                                          width: 1, color: Colors.black12)),
                                  onPressed: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      allowMultiple: false,
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf'],
                                    );

                                    file = result?.files?.first;
                                    setState(() {
                                      fileName = file!.name;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          fileName == null
                                              ? 'Select File'
                                              : fileName!,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)), // <-- Text
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        // <-- Icon
                                        Icons.file_present,
                                        size: 24.0,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            new Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                            ),
                            SizedBox(
                              height: 1,
                            ),

                            /// Button
                            Container(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    side: BorderSide(
                                        width: 1, color: Colors.black12)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (selectedDate == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Please select deadline')),
                                      );
                                    } else if (fileName == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Please select file')),
                                      );
                                    } else {
                                      /// Now upload file to the server first and get the url
                                      uploadFile();
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    isLoading
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,

                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                                const Text(
                                                  'Submitting...',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
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
                                              ])
                                        : Text('Submit',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color:
                                                    Colors.white)), // <-- Text
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void uploadFile() async {
    setState(() {
      isLoading = true;
    });

    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef =
        storageRef.child(DateTime.now().millisecondsSinceEpoch.toString());

    print("FILE is");
    print(file);

    var fileData = File(file!.path!);

    await mountainsRef.putFile(fileData);
    final url = await mountainsRef.getDownloadURL();

    final homework = HomeworkData(
        Uuid().v1(),
        titleController.text,
        DateFormat('yyyy-MM-dd').format(selectedDate!),
        url,
        widget.teacherId,
        widget.subjectId);

    final DatabaseReference homeworkRef =
        FirebaseDatabase.instance.ref().child('homework');

    homeworkRef.push().set(homework.toJson()).then((value) => {
          setState(() {
            isLoading = false;
          })
        });

    NotificationAPI().save(NotificationData(
        titleController.text,
        "New homework has been added.",
        DateFormat('yyyy-MM-dd').format(DateTime.now())));
    FCMApi().sendFcm(
        titleController.text,
        "New homework has been added with deadline of $DateFormat('yyyy-MM-dd').format(DateTime.now())",
        "");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Successfully added new assignmnent.')),
    );

    Navigator.of(context).pop();
  }
}
