import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/teacher.dart';
import 'package:flutter_application_2/widgets/teachersubject.dart';


class teacherdashboard extends StatefulWidget {
  final List<Teacher> teachers = [
    Teacher("Yubaraj Devkota", [
      Subject("Digital Logic", "1st semester"),
      Subject("C Programming", "2nd semester"),
      Subject("Advanced Java", "6th semester")
    ]),
    Teacher(" Kiran Poudel", [Subject("Mobile Programing", "6th semester")]),
    Teacher("Akhilesh Yadav", [Subject("Distributed System", "6th semester")]),
    Teacher("Santosh Acharya", [Subject("Applied Economics", "6th semester")]),
    Teacher("Binod Paneru", [Subject("Network Programming", "6th semester")]),
  ];

  @override
  State<teacherdashboard> createState() => _teacherdashboardState();
}

class _teacherdashboardState extends State<teacherdashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",
            style: TextStyle(
              fontSize: 22,
            )),
      ),
      body: ListView.builder(
        itemCount: widget.teachers.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      teachersubject(names: widget.teachers[index].subjects)))
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.all(2),
              color: Color.fromARGB(255, 206, 223, 218),
              child: Center(
                child: Text(
                  widget.teachers[index].name + widget.names[index].semester,
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
