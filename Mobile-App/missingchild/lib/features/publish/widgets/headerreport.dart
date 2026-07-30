import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget header_report() {
  return Container(
    width: double.infinity.w,
    padding: const EdgeInsets.only(top: 40, bottom: 35),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff1565C0), Color(0xff42A5F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
    ),
    child: const Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: Icon(Icons.campaign, size: 38, color: Color(0xff1565C0)),
        ),

        SizedBox(height: 18),

        Text(
          "Report Case",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
