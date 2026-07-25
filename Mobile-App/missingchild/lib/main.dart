import 'package:flutter/material.dart';
import 'package:missingchild/features/about/screens/about_screen.dart';
import 'package:missingchild/features/auth/screens/login.dart';
import 'package:missingchild/features/auth/screens/register.dart';
import 'package:missingchild/features/auth/screens/resetpass.dart';
import 'package:missingchild/features/feedback/screens/feedback.dart';
import 'package:missingchild/features/feedback/screens/rate.dart';
import 'package:missingchild/features/home/screen/home.dart';
import 'package:missingchild/features/loading/screen/loadingpage.dart';
import 'package:missingchild/features/map/screens/showmap.dart';
import 'package:missingchild/features/notification/screens/notification.dart';
import 'package:missingchild/features/profile/screens/editprofile.dart';
import 'package:missingchild/features/profile/screens/profile.dart';
import 'package:missingchild/features/publish/screens/publish.dart';
import 'package:missingchild/features/reports/screens/accident.dart';
import 'package:missingchild/features/reports/screens/found.dart';
import 'package:missingchild/features/reports/screens/missing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
        'main': (context) => MyApp(),
        'map': (context) => Showmap(),
        'publish': (context) => Publish(),
        'home': (context) => Home(),
        'profile': (context) => Profile(),
        'notification': (context) => Notificationpage(),
        'missing': (context) => Missing(),
        'found': (context) => Found(),
        'load': (context) => WelcomeScreen(),
        'editprofile': (context) => Editprofile(),
        'login': (context) => Login(),
        'register': (context) => Register(),
        'reset': (context) => Resetpass(),
        'accident': (context) => Accident(),
        'feedback': (context) => FeedbackPage(),
        'rate': (context) => RatePage(),
        'about': (context) => AboutPage(),
      },

      home: WelcomeScreen(),
    );
  }
}
