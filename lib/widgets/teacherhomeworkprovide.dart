import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class teacherhomeworkprovide extends StatefulWidget {
  const teacherhomeworkprovide({Key? key}) : super(key: key);

  @override
  _teacherhomeworkprovideState createState() => _teacherhomeworkprovideState();
}

class _teacherhomeworkprovideState extends State<teacherhomeworkprovide> {
  String? errorMessage;

  get changeButon => null;
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;

  String? fileName;

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
          title: Text("Upload New Assignment"),
          elevation: 0,
        ),
        body: Stack(
          children: [
           
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                //top: MediaQuery.of(context).size.height * 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [            
                      
                          Container(
                            height: 50,
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Title",
                                  hintStyle: TextStyle(color: Colors.teal),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            minLines: 5,
                            maxLines: 6,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText:
                                    "Description (Optional)",
                                hintStyle: TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                



Container(
  height: 40,
  width: double.infinity,
  child:   ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Colors.white, side: BorderSide(width: 1, color: Colors.black12)),
    onPressed: () async {
final date = DateTime.now() ;
       final pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(date.year, date.month + 1, date.day));



       if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });
       }
    },
    child: Row(

      // mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: Text((selectedDate == null) ? 'Select Deadline' : "Deadline: " + DateFormat('yyyy-MM-dd').format(selectedDate!), style: TextStyle(fontSize: 18, color: Colors.black))), // <-- Text
       
        Icon( // <-- Icon
          Icons.calendar_month,
          size: 24.0,
          color: Colors.black,
        ),
      ],
    ),
  ),
),

  SizedBox(
                            height: 20,
                          ),

/// Button
  Row(
    
    children: [
      Text("File:", style: TextStyle(fontSize: 18),),
      SizedBox(width: 10,),
      ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white, side: BorderSide(width: 1, color: Colors.black12)),
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      final abc = result?.files?.first?.name;
 setState(() {
              fileName = abc!;
      });
 
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text( fileName == null ? 'Select File' : fileName!, style: TextStyle(fontSize: 18, color: Colors.black)), // <-- Text
          SizedBox(
            width: 5,
          ),
          Icon( // <-- Icon
            Icons.file_present,
            size: 24.0,
            color: Colors.black,
          ),
        ],
      ),
),
    ],
  ),


 SizedBox(
                            height: 20,
                          ),

                         
                          new Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          SizedBox(
                            height: 1,
                          ),


/// Button
  Container(
    height: 40,
    width: double.infinity,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Colors.teal, side: BorderSide(width: 1, color: Colors.black12)),
    onPressed: () {
      //getPdfAndUpload(1);
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Submit', style: TextStyle(fontSize: 18, color: Colors.white)), // <-- Text
        SizedBox(
          width: 5,
        ),
      ],
    ),
),
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

