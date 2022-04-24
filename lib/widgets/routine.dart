import 'package:flutter/material.dart';

class Routine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Routine"),
        ),
        body: Image(
          image: AssetImage("assets/images/Routine.jpg"),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ));
  }
}
