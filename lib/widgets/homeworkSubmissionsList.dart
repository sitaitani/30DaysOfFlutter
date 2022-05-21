import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/utils/NotificationAPI.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/teacherhomeworkprovide.dart';

import '../Models/submittedHomework.dart';
import 'emptyWidget.dart';

class homeworkSubmitList extends StatefulWidget {

    const homeworkSubmitList({Key? key, required this.assignmentId}) : super(key: key);

final String assignmentId;

  @override
  State<homeworkSubmitList> createState() => homeworkSubmitListState();
}

class homeworkSubmitListState extends State<homeworkSubmitList> {

  List<HomeworkSubmitData> homeworkSubmittedList = [];
  
  var isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      getDataFromAPI();
  }

void getDataFromAPI() async {
 List<HomeworkSubmitData> list = await HomeworkSubmitAPI().getHomeworks();
    setState(() {
      isLoading = false;

      /// Now filter homework based on the subject id
      
      homeworkSubmittedList = list.where((element) => element.assignmnetId == widget.assignmentId).toList();
      
    }); 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Submission",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ),
        
        body: Stack(
          children: [
            isLoading ? Center(child: CircularProgressIndicator()) :
            homeworkSubmittedList.isEmpty ?
             Container(
              color: Colors.white,
              child: EmptyWidget(
                  "No Submission Yet",
                  "No one has submitted this assignment.",
                  "empty.jpg"))
          :
            ListView.builder(
              itemCount: homeworkSubmittedList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () => {
                      
                      Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => submittedHomework(
                                  submittedHomeworkData: homeworkSubmittedList[index],
                                )))
                      
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
                                    homeworkSubmittedList[index].studentName,
                                    style: Style.titleStyle,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                          "Submitted on " + homeworkSubmittedList[index].uploadedDate,
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
