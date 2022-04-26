import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/bustrack.dart';
import 'package:flutter_application_2/widgets/notification.dart';
import 'package:flutter_application_2/widgets/readingmaterial.dart';
import 'package:flutter_application_2/widgets/routine.dart';
import 'package:flutter_application_2/widgets/webview.dart';
import 'package:share_plus/share_plus.dart';

import 'homework.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Image =
    //   "https://previews.123rf.com/images/aquir/aquir1311/aquir131100316/23569861-サンプルのグランジ赤ラウンド-スタンプ.jpg?fj=1";
    return Drawer(
      child: Container(
        color: Colors.white10,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,

                /// decoration: BoxDecoration(color: Colors.teal),
                accountName: Text("Sita Itani"),
                accountEmail: Text("sitaitani99@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/sita.jpg"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.create,
                color: Colors.black,
              ),
              title: Text(
                "Homework",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListviewHomework()))
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.calendar_today,
                color: Colors.black,
              ),
              title: Text(
                "Routine",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Routine()))
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.book,
                color: Colors.black,
              ),
              title: Text(
                "Reading Material",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReadingMaterial()))
              },
            ),
            //ListTile(
            //leading: Icon(
            //CupertinoIcons.group_solid,
            //color: Colors.black,
            //),
            //title: Text(
            // "Material",
            //textScaleFactor: 1.2,
            //style: TextStyle(
            //color: Colors.black,
            //),
            //)),
            ListTile(
              leading: Icon(
                CupertinoIcons.bell,
                color: Colors.black,
              ),
              title: Text(
                "Notification",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              //onTap: () => {
               // Navigator.of(context).push(
                    //MaterialPageRoute(builder: (context) => NotificationList()))
              //},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bus,
                color: Colors.black,
              ),
              title: Text(
                "Bus Tracking",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => bustrack()))
              },
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.black12,
              indent: 5,
              endIndent: 5,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.lock_fill,
                color: Colors.black,
              ),
              title: Text(
                "Privacy Policy",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebviewExample(
                        url:
                            "https://sites.google.com/view/eschoolproject/privacypolicy",
                        title: "Privacy Policy")))
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.info_circle,
                color: Colors.black,
              ),
              title: Text(
                "About Us",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebviewExample(
                        url:
                            "https://sites.google.com/view/eschoolproject/about",
                        title: "About Us")))
              },
            ),
            ListTile(
              leading: Icon(
                //leading: Icon(
                Icons.share,
                color: Colors.black,
              ),
              title: Text(
                "Share",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => {
                Share.share(
                    "Download eSchool application through given lin www.eschool.com")
              },
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.square_arrow_right,
                  color: Colors.black,
                ),
                title: Text(
                  "Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
