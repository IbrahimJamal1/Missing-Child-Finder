import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildImageCard(String imagePath) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 5.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.06),
          blurRadius: 20.r,
          offset: Offset(0, 8.h),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    ),
  );
}
