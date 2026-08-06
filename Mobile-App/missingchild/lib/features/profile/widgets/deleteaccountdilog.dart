import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget deleteAccountDialog({required VoidCallback onDelete}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    child: Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Colors.red.withOpacity(0.1),
            child: Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
              size: 35.sp,
            ),
          ),

          SizedBox(height: 20.h),

          Text(
            "Delete Account",
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12.h),

          Text(
            "Are you sure you want to delete your account?\nThis action cannot be undone.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
          ),

          SizedBox(height: 24.h),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onDelete,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: const Text("Delete"),
                ),
              ),

              SizedBox(width: 12.w),
            ],
          ),
        ],
      ),
    ),
  );
}
