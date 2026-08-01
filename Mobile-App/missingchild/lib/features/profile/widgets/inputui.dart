  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  // Helper decoration to eliminate code duplication across fields
  InputDecoration buildInputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: const Color(0xff64748B),
        fontSize: 14.sp,
      ),
      prefixIcon: Icon(
        icon,
        color: const Color(0xff3B82F6),
        size: 22.r,
      ),
      filled: true,
      fillColor: const Color(0xffF8FAFC),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: Color(0xffE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: const Color(0xff3B82F6),
          width: 1.5.w,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: Color(0xffEF4444)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: const Color(0xffEF4444),
          width: 1.5.w,
        ),
      ),
    );
  }