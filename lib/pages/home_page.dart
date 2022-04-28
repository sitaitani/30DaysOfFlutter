import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/User.dart';
import 'package:flutter_application_2/utils/Constants.dart';
import 'package:intl/intl.dart';

import '../widgets/drawer.dart';
import '../widgets/routineTile.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //final int days = 30;

  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eSchool"),
      ),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome " + name,
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      ),
                ),
              ),

SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset("assets/images/main.webp")
                ),

SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Assignment",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                ),

                SizedBox(height: 10,),
                
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Padding(padding: EdgeInsets.only(top: 16, bottom: 16, left: 8), child: Text("Today is last day to submit assignment of C", style: TextStyle(fontSize: 17),)),
                  ),
                ),

                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Current Class",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                ),



                Container(
                  width: double.infinity,
                  child: Card(
                    child: Padding(padding: EdgeInsets.only(top: 16, bottom: 16, left: 8), child: Text("Project defense is going on.", style: TextStyle(fontSize: 17),)),
                  ),
                )
            ],
          )
          ),
      drawer: MyDrawer(),
    );
  }

  void getUserDetail() async {
    final query = FirebaseDatabase.instance.ref().child('/users');

    query.once().then((snapshot) {
      final List<UserData> allUsers = [];
      Map<String, dynamic>.from(snapshot.snapshot.value as dynamic)
          .forEach((key, value) => allUsers.add(UserData.fromJson(value)));

      final user = allUsers.firstWhere(
          (element) => element.uid == FirebaseAuth.instance.currentUser?.uid);
      userInformation = user;
      setState(() {
        name = user.name;
      });
    });
  }
  }
