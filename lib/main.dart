import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/User.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/register.dart';
import 'package:flutter_application_2/utils/DatabaseHelper.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/homework.dart';
import 'package:flutter_application_2/widgets/notification.dart';
import 'package:flutter_application_2/widgets/teacherdashboard.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'Models/Notification.dart';
import 'package:intl/intl.dart';

//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

/// Subscribe to all
FirebaseMessaging.instance.subscribeToTopic("all");


  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MyApp());
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    handleNotificationEvents();

    // TODO: implement initState
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      globalNotificationList.insert(
          0,
          NotificationData(
              notification?.title ?? "Title",
              notification?.body ?? "Description",
              DateFormat('yyyy-MM-dd').format(DateTime.now())));

      handleUpcomingNotification();

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,

                color: Colors.blue,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? MyRoutes.loginRoute
          : MyRoutes.loginRoute,
      routes: {
        "/": (context) => teacherdashboard(),
        MyRoutes.homeRoute: (context) => teacherdashboard(),
        MyRoutes.loginRoute: (context) => ListviewHomework(),
        MyRoutes.registerRoute: (context) => Myregister(),
        //MyRoutes.registerRoute: (context) => teacherdashboard()
      },
    );
  }

  void handleNotificationEvents() async {
    DatabaseHandler.db.retrieveNotifications().then((value) => {
          if (value.isEmpty)
            {
              globalNotificationList = [
                NotificationData(
                    "Invitation for 35th Anniversary",
                    "We on the behalf of KSMC invites you to the 35th anniversary program of the college on Baisakh 20.",
                    "2022-04-05"),
                NotificationData(
                    "Happy New Year 2079",
                    "We wish you happy new year for 2079. May this year gives you immense pleasure",
                    "2022-04-01"),
                NotificationData(
                    "Account created successfully",
                    "Congratulations! you have successfully created your account. Enjyoy benefits of eSchool.",
                    "2022-01-01"),
              ]
            }
          else
            {globalNotificationList = value}
        });
  }

  void handleUpcomingNotification() async {
    DatabaseHandler.db.insertNotification(globalNotificationList);
  }
}
