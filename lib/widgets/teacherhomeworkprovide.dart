import 'package:flutter/material.dart';

class teacherhomeworkprovid extends StatefulWidget {
  @override
  State<teacherhomeworkprovid> createState() => _teacherhomeworkprovideState();
}

class _teacherhomeworkprovideState extends State<teacherhomeworkprovid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignments"),
        
      ),
      body: AssignmentCard(
    // optional, if deadline is not passed, deadline card will not be shown
    deadline: DateTime.now(),
    question:
        'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
    subject: 'Mobile Programming',
    teacher: 'Kiran Poudel',
    deadlineBackgroundColor: Colors.red,
    onUploadHandler: () {
        print('Handle upload');
        // optional, if null is passsed upload button will be hidden
    },
    // optional
    fileList: [
        FileWrapper(
            fileName: 'assignment-information.pdf',
            fileSize: '11.5 KB',
            onTap: () {
            print('Handle on tap');
            },
        ),
    ],
),
    );
  }
}

