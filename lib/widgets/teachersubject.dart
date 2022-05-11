import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/teacherdashboard.dart';

import '../Models/teacher.dart';

class teachersubject extends StatefulWidget {
  const teachersubject({Key? key, required this.names}) : super(key: key);
  final List<Subject> names;
  @override
  State<teachersubject> createState() => _teachersubjectState();
}

class _teachersubjectState extends State<teachersubject> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subject",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.names.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.all(2),
              color: Color.fromARGB(255, 206, 223, 218),
              child: Center(
                child: Text(
                  widget.names[index].name,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
