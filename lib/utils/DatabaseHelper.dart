import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_application_2/Models/Notification.dart';

class DatabaseHandler {
   DatabaseHandler._();
  static final DatabaseHandler db = DatabaseHandler._();

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE notification(title TEXT, description TEXT, date TEXT)",
        );
      },
      
      version: 1,
    );
  }


  Future<int> insertNotification(List<NotificationData> contents) async {
    int result = 0;
    final Database db = await initializeDB();

    final isDeleted =   await db.execute(
          "delete from notification",
        );

    for(var content in contents){
      result = await db.insert('notification', content.toJson());
    }
    return result;
  }


    Future<List<NotificationData>> retrieveNotifications() async {
    final Database db = await initializeDB();
        final List<Map<String, Object?>> queryResult = await db.query('notification');
    final list = queryResult.map((e) => NotificationData.fromJson(e)).toList();
  
    return list;
  }
}