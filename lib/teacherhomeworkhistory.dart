import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/teacherhomeworkprovide.dart';

class teacherhomeworkhistory extends StatefulWidget {
  @override
  State<teacherhomeworkhistory> createState() => _teacherhomeworkhistoryState();
}

class _teacherhomeworkhistoryState extends State<teacherhomeworkhistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Assignment",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () => {},
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 20, bottom: 15),
                      child: Container(
                        height: 70,
                        margin: EdgeInsets.all(2),
                        color: Colors.white10,
                        child: Center(
                          child: Text(
                            "Assignment 1",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )));
              },
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 103, 72, 109),
                  child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => teacherhomeworkprovide()));
                      },

                      // },
                      child: const Text(
                        "Add Assignment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
