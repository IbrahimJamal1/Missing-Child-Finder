import 'package:ai_safetrack/core/services/gataddressloca.dart';
import 'package:ai_safetrack/core/services/qrcode.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/reports/widget/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget actionButtonPost({
  required BuildContext context,
  required String status,
  required String description,
  required String childName,
  required String age,
  required String phone,
  required String reporterName,
  required LatLng location, 
  String? lastseen,
}) {
  final double width = MediaQuery.of(context).size.width;

  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 48.h,
          child: ElevatedButton.icon(
            onPressed: () {
              showShareDialog(
                context,
                onShare: () {

                },
              );
            },
            icon: Icon(
              Icons.share_rounded,
              size: 18.r,
            ),
            label: Text(
              "Share",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppFont.button(width),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 8.w),
      Expanded(
        child: SizedBox(
          height: 48.h,
          child: ElevatedButton.icon(
            onPressed: () async {
              final address = await getAddressFromLatLng(
                location.latitude,
                location.longitude,
              );

              if (!context.mounted) return;

              showQrCode(
                context,
                reporterName: reporterName,
                name: childName,
                phone: phone,
                age: age,
                status: status,
                description: description,
                location: address,
                lastseen:lastseen
              );
            },
            icon: Icon(
              Icons.qr_code_rounded,
              size: 18.r,
            ),
            label: Text(
              "QR",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppFont.button(width),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF97316),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 8.w),
      Expanded(
        child: SizedBox(
          height: 48.h,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, 'comment');
            },
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              size: 18.r,
            ),
            label: Text(
              "Comment",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppFont.button(width),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEFF6FF),
              foregroundColor: const Color(0xFF1E3A8A),
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}