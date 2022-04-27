import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/User.dart';

import '../widgets/drawer.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "codepur";

@override
  void initState() {
    // TODO: implement initState
    getUserDetail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of Flutter by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

   void getUserDetail() async {
    final query = FirebaseDatabase.instance.ref().child('/users');
    
     query.once().then((snapshot) {

      final List<UserData> allUsers = [];
      Map<String, dynamic>.from(snapshot.snapshot.value as dynamic).forEach((key, value) => allUsers.add(UserData.fromJson(value)));

      final user = allUsers.firstWhere((element) => element.uid == FirebaseAuth.instance.currentUser?.uid);
      userInformation = user;
    });
  }
}
