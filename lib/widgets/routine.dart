import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/routineTile.dart';
import 'package:intl/intl.dart';


class RoutinePage extends StatefulWidget {
  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage>
    with SingleTickerProviderStateMixin {
  // define your tab controller here
  late TabController _tabController;


List<Routine> sundayRoutine = [
  Routine("Mobile Programming", "6:20 am to 7:10 am", "Kiran Poudel"),
  Routine("Network Programming", "7:10 am to 8:00 am", "Binod Paneru"),
  Routine("Network Programming", "8:00 am to 8:50 am", "ABC"),
  Routine("BREAK", "8:50 am to 9:20 am", ""),
  Routine("Java2", "9:20 am to 10:10 am", "ABC"),
  Routine("Mobile Programming", "6:30 am to 9:00 am", "ABC"),
];

List<Routine> mondayRoutine = [
  Routine("Mobile Programming", "6:20 am to 7:10  am", "ABC"),
  Routine("Network Programming", "7:10 am to 8:00 am", "ABC"),
  Routine("Network Programming", "8:00 am to 8:50 am", "ABC"),
  Routine("BREAK", "8:50 am to 9:20 am", ""),
  Routine("Java2", "9:20 am to 10:10 am", "ABC"),
  Routine("Mobile Programming", "6:30 am to 9:00 am", "ABC"),
];

List<Routine> tuesdayRoutine = [
  Routine("Mobile Programming", "6:20 am to 7:10  am", "ABC"),
  Routine("Network Programming", "7:10 am to 8:00 am", "ABC"),
  Routine("Network Programming", "8:00 am to 8:50 am", "ABC"),
  Routine("BREAK", "8:50 am to 9:20 am", ""),
  Routine("Java2", "9:20 am to 10:10 am", "ABC"),
  Routine("Mobile Programming", "6:30 am to 9:00 am", "ABC"),
  Routine("Mobile Programming", "6:30 am to 9:00 am", "ABC"),
];

List<Routine> wednesdayRoutine = [
  Routine("Mobile Programming", "6:20 am to 7:10  am", "ABC"),
 Routine("Network Programming", "7:10 am to 8:00 am", "ABC"),
  Routine("Network Programming", "8:00 am to 8:50 am", "ABC"),
  Routine("BREAK", "8:50 am to 9:20 am", ""),
  Routine("Java2", "9:20 am to 10:10 am", "ABC"),
  Routine("Mobile Programming", "6:30 am to 9:00 am", "ABC"),
];

List<Routine> thursdayRoutine = [
  Routine("Network Programming", "6:20 am to 7:10  am", "ABC"),
 Routine("Network Programming", "7:10 am to 8:00 am", "ABC"),
  Routine("Network Programming", "8:00 am to 8:50 am", "ABC"),
  Routine("BREAK", "8:50 am to 9:20 am", ""),
  Routine("Java2", "9:20 am to 10:10 am", "ABC"),
  Routine("Mobile Programming", "6:30 am to 9:00 am", "ABC"),
];

List<Routine> fridayRoutine = [
  Routine("Network Programming", "6:20 am to 7:10  am", "ABC"),
  Routine("Network Programming", "7:10 am to 8:00 am", "ABC"),
  Routine("Network Programming", "8:00 am to 8:50 am", "ABC"),
  Routine("BREAK", "8:50 am to 9:20 am", ""),
  Routine("Java2", "9:20 am to 10:10 am", "ABC"),
  Routine("Mobile Programming", "6:30 am to 9:00 am", "ABC"),
];

  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 6, vsync: this);

  changeTabSelection();
  

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Routine"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.teal,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              tabs: <Widget>[
                Text('Sunday'),
                Text('Monday'),
                Text('Tuesday'),
                Text('Wednesday'),
                Text('Thursday'),
                Text('Friday'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(child: RoutileTile(index: index, routine: sundayRoutine[index],));
                  },
                  itemCount: sundayRoutine.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 50),
                  scrollDirection: Axis.vertical,
                ),
                ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(child: RoutileTile(index: index, routine: mondayRoutine[index],));
                  },
                  itemCount: mondayRoutine.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 50),
                  scrollDirection: Axis.vertical,
                ),
                ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(child: RoutileTile(index: index, routine: tuesdayRoutine[index],));
                  },
                  itemCount: tuesdayRoutine.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 50),
                  scrollDirection: Axis.vertical,
                ),
                ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(child: RoutileTile(index: index, routine: wednesdayRoutine[index],));
                  },
                  itemCount: wednesdayRoutine.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 50),
                  scrollDirection: Axis.vertical,
                ),
                ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(child: RoutileTile(index: index, routine: thursdayRoutine[index],));
                  },
                  itemCount: thursdayRoutine.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 50),
                  scrollDirection: Axis.vertical,
                ),
                ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(child: RoutileTile(index: index, routine: fridayRoutine[index],));
                  },
                  itemCount: fridayRoutine.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 50),
                  scrollDirection: Axis.vertical,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeTabSelection() {
      final weekDay = DateFormat('EEEE').format(DateTime.now());
  
  int day = 0;
  switch (weekDay) {
    case "Sunday":
    day = 0;
    break;
    case "Monday":
    day = 1;
    break;
    case "Tuesday":
    day = 2;
    break;
    case "Wednesday":
    day = 3;
    break;
    case "Thursday":
    day = 4;
    break;
    case "Friday":
    day = 5;
    break;

  
  }
    print(weekDay);
    _tabController.animateTo(day);
  }
}
