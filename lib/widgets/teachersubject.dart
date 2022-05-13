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
            onTap: () => {},
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
                        Expanded(
                          child: Column(
                            CrossAxisAlignment.end,
                            Text(
                              "Semester" + widget.names[index].semester,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
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