import 'package:flutter/material.dart';
import 'package:missingchild/features/auth/screens/login.dart';
import 'package:missingchild/features/auth/screens/register.dart';
import 'package:missingchild/features/auth/screens/resetpass.dart';
import 'package:missingchild/features/loading/screen/loadingpage.dart';

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
        'login': (context) => Login(),
        'reset': (context) => Resetpass(),
        'register':(context) => Register(),
        
      },
      home: WelcomeScreen(),
    );
  }
}
