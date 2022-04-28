import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/User.dart';
import 'package:intl/intl.dart';

import '../widgets/drawer.dart';
import '../widgets/routineTile.dart';
import 'package:intl/date_symbol_data_local.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //final int days = 30;

  final String name = "";

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
        child: Text(
          "Welcome All",
          style: TextStyle(
              color: Colors.teal, fontSize: 30, fontWeight: FontWeight.bold),
        ),
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
    });
  }
}
