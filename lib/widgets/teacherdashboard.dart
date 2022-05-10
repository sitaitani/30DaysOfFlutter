import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/teachersubject.dart';

class teacherdashboard extends StatefulWidget {
  final List<String> names = <String>[
    'Yubaraj Devkota'
        'Kiran Poudel',
    'Akhilesh Yadav',
    'Bindo Paneru',
    'Santosh Acharya',
  ];
  @override
  State<teacherdashboard> createState() => _teacherdashboardState();
}

class _teacherdashboardState extends State<teacherdashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: ListView.builder(
        itemCount: widget.names.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => teachersubject()))
            },
            child: Container(
              height: 70,
              color: Colors.white,
              child: const Center(
                child: Text(widget.names[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
