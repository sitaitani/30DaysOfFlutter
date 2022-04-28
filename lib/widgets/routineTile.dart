import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/Style.dart';

class Routine {
  String subjectName = "";
  String startTime = "";
  String teacherName = "";
  String endTime = "";

  Routine(String subjectName, String startTime, String teacherName, String endTime) {
    this.subjectName = subjectName;
    this.startTime = startTime;
    this.teacherName = teacherName;
    this.endTime = endTime;
  }
}

class RoutileTile extends StatefulWidget {
  const RoutileTile({Key? key, required this.index, required this.routine})
      : super(key: key);

  final int index;

  final Routine routine;

  @override
  State<RoutileTile> createState() => _RoutileTileState();
}

class _RoutileTileState extends State<RoutileTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 20, bottom: 15),
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
                        widget.routine.subjectName,
                        style: TextStyle(
                fontSize: 17  ,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
   children: <Widget>[
     Icon(CupertinoIcons.clock, color: Colors.teal, size: 20,),
     SizedBox(width: 5),
     Text(widget.routine.startTime + "-"+widget.routine.endTime,
                      style: Style.routineTextStyle,
                      textAlign: TextAlign.justify)
   ]
 ),       


!widget.routine.teacherName.isEmpty ? 
Row(
   children: <Widget>[
     Icon(Icons.person, color: Colors.teal, size: 20,),
     SizedBox(width: 5),
     Text(widget.routine.teacherName, style: Style.routineTextStyle,)
   ]
 ) : Text("")
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
