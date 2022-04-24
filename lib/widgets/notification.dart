import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "Title",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Text("2022/01/01"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "This is the description",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
