import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/Constants.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/homeworkdetail.dart';
import 'package:flutter_application_2/widgets/routineTile.dart';
import 'package:flutter_application_2/widgets/webview.dart';
import 'package:intl/intl.dart';

import '../Models/Homework.dart';
import 'emptyWidget.dart';

class ListviewHomework extends StatefulWidget {
  @override
  State<ListviewHomework> createState() => _ListviewHomeworkState();
}

class _ListviewHomeworkState extends State<ListviewHomework> {
  List<HomeworkData> homeworkdataList = [];

  @override
  void initState() {
    getCurrentClass();
    // TODO: implement initState
    super.initState();
    testHomeworkData();
  }

  void testHomeworkData() {
    final testHomeworkData = [
      HomeworkData(
          "DL Assignment",
          "2022-04-20",
          "dlassignment"),
      HomeworkData (
          "web tech nccs old question", 
          "2022-04-26",
          "web_tech_nccs_old_question"),
      HomeworkData(
          "C Assignmnet ",
          "2022-04-29",
          "C_Assignments_updated"),
      HomeworkData(
          "AJP Exam Questions",
          "2022-05-03",
          "AJP_Exam_Questions"),
    ];

    setState(() {
      homeworkdataList = testHomeworkData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homework"),
      ),
      body: homeworkdataList.isEmpty
          ? Container(
              color: Colors.white,
              child: EmptyWidget(
                  "No Reading Materials",
                  "Currently threre are no reading materials available.",
                  "empty.jpg"))
          : Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: homeworkdataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => homeworkdetail(fileName: homeworkdataList[index].fileName,)));
                      },
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 20, bottom: 15),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
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
                                                  homeworkdataList[index]
                                                      .subject,
                                                  style: Style.titleStyle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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

                                    //* Scroe
                                  ],
                                ),
                              ),
                              Text(

                                
                                "Deadline: " + homeworkdataList[index].deadline,
                                style: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: isDeadlinedPassed(homeworkdataList[index].deadline) == "same" ? Color.fromARGB(254, 168, 82, 1): 
    isDeadlinedPassed(homeworkdataList[index].deadline) == "passed" ? Colors.red : 
    Colors.black,
    height: 1.3,
  ),          
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      )),
                    );
                  }),
            ),
    );
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


    void getCurrentClass() {
    void changeTabSelection() {
      final weekDay = DateFormat('EEEE').format(DateTime.now());
  
  List<Routine> routineList = [];
  switch (weekDay) {
    case "Sunday":
    routineList = sundayRoutine;
    break;
    case "Monday":
    routineList = mondayRoutine;
    break;
    case "Tuesday":
    routineList = tuesdayRoutine;
    break;
    case "Wednesday":
    routineList = wednesdayRoutine;
    break;
    case "Thursday":
    routineList = thursdayRoutine;
    break;
    case "Friday":
    routineList = fridayRoutine;
    break;
  }

  final time = DateFormat('kk:mm:ss').format(DateTime.now());
  print(time);

  // routineList.forEach((element) {
  //  final classStartTime = DateTime.parse(element.startTime);//element.startTime; 
  //  print(classStartTime);
  //  final classEndTime = element.endTime;
  // });
  }}
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
           && day == other.day;
  }
}
