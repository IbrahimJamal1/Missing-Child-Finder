import 'package:flutter/material.dart';

Widget buildHeader() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(top: 30, bottom: 40),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff2563EB), Color(0xff60A5FA)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    ),

    child: Column(
      children: [
        const SizedBox(height: 15),

        const Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "Login to continue",
          style: TextStyle(color: Colors.white70, fontSize: 17),
        ),
      ],
    ),
  );
}
