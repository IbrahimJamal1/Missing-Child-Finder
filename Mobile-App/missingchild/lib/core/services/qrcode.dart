import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showQrCode(
  BuildContext context, {
  String? childId,
  required String name,
  required String phone,
  required String age,
  String? status,
  required String description,
  String? location,
}) {
  final qrData =
    '''
      Name: $name
      ${childId != null ? 'Reporter: $childId\n' : ''}
      Age: $age
      ${status != null ? 'Status: $status\n' : ''}
      Description: $description
      ${location != null ? 'Location: $location\n' : ''}
      Phone: $phone
    ''';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          "Child QR Code",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff1E293B),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Scan this code to get full person details instantly.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff64748B), fontSize: 13.sp),
            ),
            SizedBox(height: 20.h),

            SizedBox(
              width: 220.w,
              height: 220.h,
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 220,
                gapless: false,
                eyeStyle: QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xff1E3A8A),
                ),
                dataModuleStyle: QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Color(0xff1E3A8A),
                ),
              ),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              "Close",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffEF4444),
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      );
    },
  );
}
