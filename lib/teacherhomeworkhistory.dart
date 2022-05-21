import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/NotificationAPI.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';
import 'package:flutter_application_2/widgets/homeworkSubmissionsList.dart';
import 'package:flutter_application_2/widgets/teacherhomeworkprovide.dart';

import 'Models/Homework.dart';

class teacherhomeworkhistory extends StatefulWidget {

    const teacherhomeworkhistory({Key? key, required this.teacherId, required this.subjectId}) : super(key: key);

final String teacherId;

  final String subjectId;

  @override
  State<teacherhomeworkhistory> createState() => _teacherhomeworkhistoryState();
}

class _teacherhomeworkhistoryState extends State<teacherhomeworkhistory> {

    List<HomeworkData> homeworkdataList = [];

    List<HomeworkSubmitData> submittedList = [];

  var isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataFromAPI();

    print("TEACHER ID ");
    print(widget.teacherId);
    print("SUBJECT");
    print(widget.subjectId);
  }

  void getDataFromAPI() async {

   submittedList = await HomeworkSubmitAPI().getHomeworks();

 List<HomeworkData> list = await HomeworkAPI().getHomeworks();
    setState(() {
      isLoading = false;

      /// Now filter homework based on the subject id
      homeworkdataList = list.where((element) => element.subjectId == widget.subjectId).toList();
      
    }); 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Assignment",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => teacherhomeworkprovide(teacherId: widget.teacherId, subjectId: widget.subjectId))).then((value) {

                    setState(() {
                      isLoading = true;
                    });
                    getDataFromAPI();
                  })
            },
          ),
        ),
        body: 
        Stack(
          children: [
            isLoading ? Center(child: CircularProgressIndicator()) :
            homeworkdataList.isEmpty ?
            Container(
              color: Colors.white,
              child: EmptyWidget(
                  "No Assignments",
                  "You havenot assigned any assignments yet.",
                  "empty.jpg"))
          :
            ListView.builder(
              itemCount: homeworkdataList.length,
              itemBuilder: (BuildContext context, int index) {
                var number = submittedList.where((element) => element.assignmnetId == homeworkdataList[index].assignmentId).toList().length;
                return GestureDetector(
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => homeworkSubmitList(assignmentId: homeworkdataList[index].assignmentId,)))
                    },
                    
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 20, bottom: 15),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    homeworkdataList[index].subject,
                                    style: Style.titleStyle,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    "Deadline: " + homeworkdataList[index].deadline,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      height: 1.3,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  
                                  Text(
                                    
                                    "Submitted by $number students",
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      height: 1.3,
                                    ),
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
                    )));
              },
            ),
          ],
        ));
  }
}
