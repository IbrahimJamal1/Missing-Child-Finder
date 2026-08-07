import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showShareDialog(BuildContext context, {VoidCallback? onShare}) {
  double width = MediaQuery.of(context).size.width;

  return showDialog<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: Colors.white,
        titlePadding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 12.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
        actionsPadding: EdgeInsets.all(16.r),
        title: Row(
          children: [
            Icon(Icons.share_rounded, color: const Color(0xFF1E3A8A), size: 24.r),
            SizedBox(width: 10.w),
            Text(
              "Share Report",
              style: TextStyle(
                fontSize: AppFont.subtitle(width),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
          ],
        ),
        content: Text(
          "Are you sure you want to share this report?",
          style: TextStyle(
            fontSize: AppFont.body(width),
            color: const Color(0xFF64748B),
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF64748B),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              "Cancel",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppFont.button(width),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              if (onShare != null) {
                onShare();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              "Share",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppFont.button(width),
              ),
            ),
          ),
        ],
      );
    },
  );
}