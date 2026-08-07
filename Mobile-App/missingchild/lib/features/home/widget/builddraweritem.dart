import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDrawerItem({
  required double width,
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
      leading: Icon(icon, color: const Color(0xFF475569), size: 22.r),
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppFont.body(width),
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1E293B),
        ),
      ),
      onTap: onTap,
    ),
  );
}

class CustomDivider extends StatelessWidget {
  final Color color;
  const CustomDivider({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 16.h,
      thickness: 1.h,
      indent: 8.w,
      endIndent: 8.w,
      color: color,
    );
  }
}