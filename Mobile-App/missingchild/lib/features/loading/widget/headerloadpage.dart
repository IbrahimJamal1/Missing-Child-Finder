import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget headerpage(final width) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 40.h),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "images/iconwelcomepage.png",
          width: 60.w,
          height: 60.h,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hope Link",
              style: TextStyle(
                fontSize: AppFont.header(width),
                fontWeight: FontWeight.bold,
                color: const Color(0xff1E3A8A),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "Bring loved ones home",
              style: TextStyle(
                fontSize: AppFont.caption(width),
                color: const Color(0xff64748B),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
