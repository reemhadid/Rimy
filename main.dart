
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

void main() {
  runApp(RimysDreamApp());
}

class RimysDreamApp extends StatefulWidget {
  @override
  _RimysDreamAppState createState() => _RimysDreamAppState();
}

class _RimysDreamAppState extends State<RimysDreamApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  List<String> messages = [
    "أنت قادرة على تحقيق أحلامك!",
    "Keep going, you're doing great!",
    "توكل على الله، فإن مع العسر يسرا.",
    "Believe in yourself.",
    "اللهم اجعلني من المتوكلين عليك.",
    "Dream big and never give up!"
  ];

  @override
  void initState() {
    super.initState();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initSettings = InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(initSettings);
    scheduleRandomNotifications();
  }

  void scheduleRandomNotifications() async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails);

    Timer.periodic(Duration(hours: 3), (Timer timer) async {
      var rng = Random();
      String message = messages[rng.nextInt(messages.length)];
      await flutterLocalNotificationsPlugin.show(
        0,
        "RIMY'S DREAM",
        message,
        generalNotificationDetails,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          title: Text("RIMY'S DREAM"),
          backgroundColor: Colors.pink[200],
        ),
        body: Center(
          child: Text(
            "مرحباً بك في تطبيقك التحفيزي!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
