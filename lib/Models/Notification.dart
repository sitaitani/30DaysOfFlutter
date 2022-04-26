
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  var flutterLocalNotificationsPlugin;
  var channel;
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
 
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

class NotificationData {
  String title = "";
  String description = "";

  NotificationData(String title, String description) {
    this.title = title;
    this.description = description;
  }

  NotificationData.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'] as String;
    description = json['description'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'title': title,
        'description': description,
      };
}
