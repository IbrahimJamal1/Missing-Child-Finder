import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showQrCode(
  BuildContext context, {
  required String childId,
  required String name,
  required String phone,
  required String age,
  required String status,
  required String description,
  required String location,
}) {
  final qrData =
    '''
    Name: $name
    Reporter: $childId
    Age: $age
    Status: $status
    Description: $description
    Location: $location
    Phone:$phone
    ''';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // حواف دائرية متناسقة
        ),
        title: const Text(
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
            const Text(
              "Scan this code to get full child details instantly.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff64748B), fontSize: 13),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: 220,
              height: 220,
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 220,
                gapless: false,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xff1E3A8A),
                ),
                dataModuleStyle: const QrDataModuleStyle(
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              "Close",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffEF4444),
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
    },
  );
}
