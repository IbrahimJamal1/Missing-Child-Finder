import 'package:ai_safetrack/features/about/screens/about_screen.dart';
import 'package:ai_safetrack/features/auth/screens/login.dart';
import 'package:ai_safetrack/features/auth/screens/register.dart';
import 'package:ai_safetrack/features/auth/screens/resetpass.dart';
import 'package:ai_safetrack/features/feedback/screens/feedback.dart';
import 'package:ai_safetrack/features/feedback/screens/rate.dart';
import 'package:ai_safetrack/features/home/screen/home.dart';
import 'package:ai_safetrack/features/loading/screen/loadingpage.dart';
import 'package:ai_safetrack/features/map/screens/showmap.dart';
import 'package:ai_safetrack/features/notification/screens/notification.dart';
import 'package:ai_safetrack/features/profile/screens/editprofile.dart';
import 'package:ai_safetrack/features/profile/screens/profile.dart';
import 'package:ai_safetrack/features/publish/screens/publish.dart';
import 'package:ai_safetrack/features/reports/screens/accident.dart';
import 'package:ai_safetrack/features/reports/screens/found.dart';
import 'package:ai_safetrack/features/reports/screens/missing.dart';
import 'package:flutter/material.dart';

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
