import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildActionButtons(bool isWideScreen,context) {
  return Container(
    constraints: BoxConstraints(maxWidth: isWideScreen ? 500 : double.infinity),
    child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52.h,
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, 'publish'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffDC2626),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Text(
              "Publish Report",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, "login"),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Text("Log In", style: TextStyle(fontSize: 15.sp)),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'register'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  backgroundColor: const Color(0xff2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
