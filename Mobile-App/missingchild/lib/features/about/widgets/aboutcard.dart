import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildAboutCard({
  required String title,
  required IconData icon,
  required Color iconColor,
  required String description,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20.r),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.02),
          blurRadius: 12.r,
          offset: Offset(0, 4.h),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 22.r),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1E293B),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          description,
          style: TextStyle(
            color: const Color(0xff475569),
            fontSize: 14.sp,
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}