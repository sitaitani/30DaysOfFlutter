import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/homeworkdetail.dart';
import 'package:flutter_application_2/widgets/webview.dart';

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
    // TODO: implement initState
    super.initState();
    testHomeworkData();
  }

  void testHomeworkData() {
    final testHomeworkData = [
      HomeworkData(
          "DL Assignment",
          // "Question 1, //Question 7 and Question of chapter 2",
          "2022-04-20"),
      HomeworkData(
          "web tech nccs old question", //"Question 1, Question 7 and Question of chapter 2",
          "2022-04-27"),
      HomeworkData(
          "C Assignments_updated",
          //"Question 1, Question 7 and Question of chapter 2",
          "2022-04-30"),
          HomeworkData(
          "AJP_Exam_Questions",
          //"Question 1, Question 7 and Question of chapter 2",
          "2022-05-03"),
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
                            builder: (context) => homeworkdetail()));
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
}


extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
           && day == other.day;
  }
}
