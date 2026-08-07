import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildFeatureRow(IconData icon, String title, String subtitle, BuildContext context) {
      final width = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: const Color(0xffF1F5F9),
          child: Icon(icon, color: const Color(0xff475569), size: 18.r),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff334155),
                  fontSize: AppFont.body(width),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: const Color(0xff64748B),
                  fontSize: AppFont.caption(width),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}