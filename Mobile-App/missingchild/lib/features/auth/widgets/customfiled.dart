import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomField({
  required final width,
  required IconData icon,
  required String label,
  bool obscure = false,
  TextInputType keyboard = TextInputType.text,
  TextEditingController? controller,
  Widget? suffixIcon,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: TextFormField(
      obscureText: obscure,
      keyboardType: keyboard,
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: AppFont.body(width),
        color: const Color(0xFF0F172A),
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: AppFont.body(width),
        ),
        prefixIcon: Icon(icon, color: const Color(0xFF3B82F6), size: 22.r),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.red.shade400),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.red.shade400, width: 2),
        ),
      ),
    ),
  );
}