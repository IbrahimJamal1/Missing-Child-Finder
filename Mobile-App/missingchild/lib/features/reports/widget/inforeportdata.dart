import 'package:ai_safetrack/core/services/callphone.dart';
import 'package:ai_safetrack/core/services/formatreportdate.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imforeportdata(report,context,width) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16.w, 16.h, 12.w, 12.h),
    child: Row(
      children: [
        // Profile Image
        Container(
          padding: EdgeInsets.all(2.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xffDBEAFE), width: 2),
          ),
          child: CircleAvatar(
            radius: 23.r,
            backgroundColor: Colors.grey.shade100,
            backgroundImage: NetworkImage(report.reporterImage),
          ),
        ),

        SizedBox(width: 12.w),

        // Name + Date
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'userprofile');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report.reporterName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppFont.body(width),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0F172A),
                  ),
                ),

                SizedBox(height: 4.h),

                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14.r,
                      color: const Color(0xFF7B7A7A),
                    ),

                    SizedBox(width: 4.w),

                    Expanded(
                      child: Text(
                        formatReportDate(report.reportDate.toString()),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: AppFont.caption(width),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Call Button
        Material(
          color: const Color(0xffEFF6FF),
          shape: const CircleBorder(),
          child: IconButton(
            onPressed:
                report.onCall ??
                () {
                  makePhoneCall(report.phone);
                },
            icon: Icon(
              Icons.phone_rounded,
              color: const Color(0xff2563EB),
              size: 20.r,
            ),
          ),
        ),
      ],
    ),
  );
}
