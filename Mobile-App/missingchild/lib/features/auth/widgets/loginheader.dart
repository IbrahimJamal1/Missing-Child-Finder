import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHeader() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(top: 30.h, bottom: 40.h),
    decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff2563EB), Color(0xff60A5FA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r),
              bottomRight: Radius.circular(40.r),
            ),
          ),
    child: Column(
      children: [
        SizedBox(height: 15.h),
        Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Login to continue",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 17.sp,
          ),
        ),
      ],
    ),
  );
}