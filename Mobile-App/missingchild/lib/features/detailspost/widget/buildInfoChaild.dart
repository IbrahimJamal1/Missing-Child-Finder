 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildinfochailddata({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),

          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),

            borderRadius: BorderRadius.circular(10.r),
          ),

          child: Icon(icon, color: iconColor, size: 20.r),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                label,

                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 2.h),

              Text(
                value,

                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF1E293B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
