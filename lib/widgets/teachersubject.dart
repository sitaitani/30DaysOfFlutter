import 'package:flutter/material.dart';

class teachersubject extends StatefulWidget {
  @override
  State<teachersubject> createState() => _teachersubjectState();
}

class _teachersubjectState extends State<teachersubject> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 70,
            color: Colors.white,
            child: const Center(child: Text('Advanced jaava')),
          ),
          Container(
            height: 70,
            color: Colors.white,
            child: const Center(child: Text('Mobile Programming')),
          ),
          Container(
            height: 70,
            color: Colors.white10,
            child: const Center(child: Text('Distributed System')),
          ),
          Container(
            height: 70,
            color: Colors.white10,
            child: const Center(child: Text('Network Programming')),
          ),
          Container(
            height: 70,
            color: Colors.white10,
            child: const Center(child: Text('Applied Economics')),
          ),
        ],
      ),
    );
  }
}
