import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';

import '../Models/Notification.dart';

class NotificationList extends StatefulWidget {
  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  
  List<NotificationData> notificationList = [];


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    testNotifion();
  }

  void testNotifion() {
    final testNotifications = [
      NotificationData("Account created successfully", "Congratulations! you have successfully created your account. Enjyoy benefits of eSchool."),
      NotificationData("Happy New Year 2079", "We wish you happy new year for 2079. May this year gives you immense pleasure"),
      NotificationData("Iniviation for 35th Anniversary", "We on the behalf of KSMC invites you to the 35th anniversary program of the college on Baisakh 20."),
    ];

    setState(() {
      notificationList = testNotifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: 
      
      notificationList.isEmpty ? Container( color: Colors.white, child: EmptyWidget("No Notifications", "All notifications will appear here.", "empty.jpg")) :
      Container(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  notificationList[index].title,
                                  style: Style.titleStyle
                                ),
                              ),
                              Text("2022/01/01"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            notificationList[index].description,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 17.0,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}



