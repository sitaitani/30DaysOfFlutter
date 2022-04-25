import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/webview.dart';

import '../Models/ReadingMaterial.dart';
import 'emptyWidget.dart';

class ReadingMaterial extends StatefulWidget {
  @override
  State<ReadingMaterial> createState() => _ReadingMaterialState();
}

class _ReadingMaterialState extends State<ReadingMaterial> {
  List<ReadingMaterialData> readingMaterialList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testReadingMaterial();
  }

  void testReadingMaterial() {
    final testReadingMaterials = [
      ReadingMaterialData("Mobile Programming - Note",
          "Chapter 1, Chapter 2 and Chapter 3 Notes", "http://www.africau.edu/images/default/sample.pdf"),
      ReadingMaterialData("Mobile Programming - Important Questions",
          "Important questions for upcoming exam", "http://www.africau.edu/images/default/sample.pdf"),
      ReadingMaterialData(
          "Mobile Programming - Old Question", "Old Question of 2078", "http://www.africau.edu/images/default/sample.pdf")
    ];

    setState(() {
      readingMaterialList = testReadingMaterials;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reading Material"),
      ),
      body: readingMaterialList.isEmpty
          ? Container(
              color: Colors.white,
              child: EmptyWidget(
                  "No Reading Materials",
                  "Currently threre are no reading materials available.",
                  "empty.jpg"))
          : Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: readingMaterialList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebviewExample(
                        url:
                            readingMaterialList[index].link,
                        title: readingMaterialList[index].title)));
                      
                      },
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 20, bottom: 15),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    //*Image
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          //*Title
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  readingMaterialList[index]
                                                      .title,
                                                  style: Style.titleStyle,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                    
                                          Icon(
                                            Icons.chevron_right_outlined,
                                            color: Colors.teal,
                                          )
                                        ],
                                      ),
                                    ),
                    
                                    //* Scroe
                                  ],
                                ),
                              ),
                              Text(
                                readingMaterialList[index].description,
                                style: Style.normalContentStyle,
                              )
                            ],
                          ),
                        ),
                      )),
                    );
                  }),
            ),
    );
  }
}
