import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget actionbuttonloadpage(final width, context) {
  return Column(
    children: [
      // Login Button
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: double.infinity,
          height: 52.h,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, 'login',(route)=>false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2563EB),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            child: Text(
              "Log in",
              style: TextStyle(
                fontSize: AppFont.button(width),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

      SizedBox(height: 16.h),

      // Create Account Button
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),

        child: SizedBox(
          width: double.infinity,
          height: 52.h,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, 'signup',(route)=>false);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xff1E3A8A), width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            child: Text(
              "Create Account",
              style: TextStyle(
                fontSize: AppFont.button(width),
                fontWeight: FontWeight.bold,
                color: const Color(0xff1E3A8A),
              ),
            ),
          ),
        ),
      ),

      SizedBox(height: 100.h),

      // Quick Report Button Card
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'publish');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffF8FAFC),
              foregroundColor: const Color(0xff2563EB),
              elevation: 1,
              shadowColor: Colors.black12,
              padding: EdgeInsets.all(16.r),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.r),
                side: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  "images/iconpublichbutton.png",
                  width: 44.w,
                  height: 44.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quick Report",
                        style: TextStyle(
                          fontSize: AppFont.subtitle(width),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1E3A8A),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Report a missing or found person in just a few steps",
                        style: TextStyle(
                          fontSize: AppFont.caption(width),
                          color: const Color(0xff64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.r,
                  color: const Color(0xff1E3A8A),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
