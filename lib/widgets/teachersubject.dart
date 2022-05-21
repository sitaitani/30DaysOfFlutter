import 'package:flutter/material.dart';
import 'package:flutter_application_2/teacherhomeworkhistory.dart';
import 'package:flutter_application_2/widgets/teacherdashboard.dart';

import '../Models/teacher.dart';

class teachersubject extends StatefulWidget {
  const teachersubject({Key? key, required this.names, required this.teacherId}) : super(key: key);
  final List<Subject> names;
  final String teacherId;
  @override
  State<teachersubject> createState() => _teachersubjectState();
}

class _teachersubjectState extends State<teachersubject> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("TEACHER ID");
    print(widget.teacherId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subject",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.names.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => teacherhomeworkhistory(teacherId: widget.teacherId, subjectId: widget.names[index].id,)))
            },
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 20, bottom: 15),
                  child: Container(
                    //color: Color.fromARGB(255, 206, 223, 218),
                    color: Colors.white10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Colors.white10,
                          child: Row(
                            children: <Widget>[
                              //*Image
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    //*Title
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            widget.names[index].name,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_outlined,
                                      color: Colors.teal,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            widget.names[index].semester,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.deepOrangeAccent,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}

              //height: 70,
              //margin: EdgeInsets.all(2),
              //color: Color.fromARGB(255, 206, 223, 218),
              //child: Center(
                //child: Text(
                  //widget.names[index].name + widget.names[index].semester,
                 // style: TextStyle(fontSize: 25, color: Colors.black),