import 'package:flutter/material.dart';

class teacherhomeworkprovide extends StatefulWidget {
  const teacherhomeworkprovide({Key? key}) : super(key: key);

  @override
  _teacherhomeworkprovideState createState() => _teacherhomeworkprovideState();
}

class _teacherhomeworkprovideState extends State<teacherhomeworkprovide> {
  String? errorMessage;

  get changeButon => null;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var DetailEditingController;
    return Container(
      decoration: BoxDecoration(
          // image: DecorationImage(
          //image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
          ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Upload Assignment"),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 25),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 90),
                //top: MediaQuery.of(context).size.height * 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Title",
                                hintStyle: TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText:
                                    "Some Description regarding the Assignment",
                                hintStyle: TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Filename",
                                hintStyle: TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Division",
                                hintStyle: TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 103, 72, 109),
                            child: MaterialButton(
                                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  //Icons.upload(EditingController.text,
                                  // passwordEditingController.text);
                                },
                                child: Text(
                                  "Upload",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
