import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageUrl =
        "https://previews.123rf.com/images/aquir/aquir1311/aquir131100316/23569861-サンプルのグランジ赤ラウンド-スタンプ.jpg?fj=1";
    return Drawer(
      child: Container(
        color: Colors.teal,
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
                  backgroundImage: NetworkImage(ImageUrl),
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            ListTile(
                leading: Icon(
                  CupertinoIcons.bookmark,
                  color: Colors.white,
                ),
                title: Text(
                  "Bookmarks",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            // ListTile(
            //     leading: Icon(
            //       CupertinoIcons.important_points,
            //       color: Colors.white,
            //     ),
            // title: Text(
            //   "Importance points",
            //   textScaleFactor: 1.2,
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            // ),
            ListTile(
                // leading: Icon(
                //   CupertinoIcons.take_quiz,
                //   color: Colors.white,
                // ),
                title: Text(
              "Take Quiz",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            )),
            Divider(
              height: 10,
              thickness: 5,
              color: Colors.brown,
              indent: 5,
              endIndent: 5,
            )
          ],
        ),
      ),
    );
  }
}
