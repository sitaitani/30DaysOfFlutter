import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/teacher.dart';
import 'package:flutter_application_2/widgets/teachersubject.dart';

class teacherdashboard extends StatefulWidget {
  final List<Teacher> teachers = [
    Teacher("Yubaraj Devkota", "1", [
      Subject("Digital Logic", "1st semester", "0"),
      Subject("C Programming", "2nd semester", "1"),
      Subject("Advanced Java", "6th semester", "2")
    ]),
    Teacher(" Kiran Poudel", "2", [Subject("Mobile Programing", "6th semester", "3")]),
    Teacher("Akhilesh Yadav", "3", [Subject("Distributed System", "6th semester", "4")]),
    Teacher("Santosh Acharya", "4", [Subject("Applied Economics", "6th semester", "5")]),
    Teacher("Binod Paneru", "5", [Subject("Network Programming", "6th semester", "6")]),
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
              fontWeight: FontWeight.bold,
            )),
      ),
      body: ListView.builder(
        itemCount: widget.teachers.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => teachersubject(teacherId: widget.teachers[index].id,
                            names: widget.teachers[index].subjects),))
                  },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20, bottom: 15),
                child: Container(
                  height: 70,
                  margin: EdgeInsets.all(2),
                  color: Colors.white10,
                  child: Center(
                    child: Text(
                      widget.teachers[index].name,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )));
        },
      ),
    );
  }
}
