import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_2/Models/Notification.dart';

import '../Models/Homework.dart';

class NotificationAPI {
  final DatabaseReference _ref =
      FirebaseDatabase.instance.ref().child('/notifications');

  void save(NotificationData notification) {
    _ref.push().set(notification.toJson());
  }

  Future<List<NotificationData>> getNotifications() async {
    List<NotificationData> list = [];

    final value = await _ref.once();

    print("VLAUE IS");

    if (value.snapshot.value == null) {
      return [];
    }
    print(value.snapshot.value);
    final map = value.snapshot.value as Map<dynamic, dynamic>;

    if (map == null) {
      return [];
    }
    map.forEach((key, value) {
      final notification = NotificationData.fromJson(value);
      list.add(notification);
    });
    return list;
  }
}

class HomeworkAPI {
  final DatabaseReference _ref =
      FirebaseDatabase.instance.ref().child('homework');

  void saveMessage(NotificationData message) {
    _ref.push().set(message.toJson());
  }

  Future<List<HomeworkData>> getHomeworks() async {
    List<HomeworkData> list = [];

    final value = await _ref.once();

    if (value.snapshot.value == null) {
      return [];
    }

    final map = value.snapshot.value as Map<dynamic, dynamic>;
    print("LIST IS");

    print(map);

    map.forEach((key, value) {
      final notification = HomeworkData.fromJson(value);
      list.add(notification);
    });

    return list;
  }
}


class HomeworkSubmitAPI {
  final DatabaseReference _ref =
      FirebaseDatabase.instance.ref().child('homeworkSubmission');

  void save(HomeworkSubmitData message) {
    _ref.push().set(message.toJson());
  }

  Future<List<HomeworkSubmitData>> getHomeworks() async {
    List<HomeworkSubmitData> list = [];

    final value = await _ref.once();

    if (value.snapshot.value == null) {
      return [];
    }

    final map = value.snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final notification = HomeworkSubmitData.fromJson(value);
      list.add(notification);
    });

    return list;
  }
}
