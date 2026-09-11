import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReportModel {
  final String reporterName;
  final String reporterImage;
  final DateTime reportDate;
  final String image;
  final String childName;
  final String status;
  final String description;
  final String age;
  final String phone;
  final String locationName;
  final LatLng location;
  final String lastseen;
  final VoidCallback? onCall;
  final String? report_id;

  ReportModel({
    required this.reporterName,
    required this.reporterImage,
    required this.reportDate,
    required this.image,
    required this.childName,
    required this.status,
    required this.description,
    required this.age,
    required this.phone,
    required this.locationName,
    required this.location,
    required this.lastseen,
    this.onCall,
    this.report_id,
  });

  // ================= FROM JSON =================

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      reporterName: json['reporterName']?.toString() ?? '',
      reporterImage: json['reporterImage']?.toString() ?? '',

      reportDate: json['reportDate'] != null
          ? DateTime.tryParse(json['reportDate'].toString()) ?? DateTime.now()
          : DateTime.now(),

      image: json['image']?.toString() ?? '',

      childName: json['childName']?.toString() ?? '',

      status: json['status']?.toString() ?? '',

      description: json['description']?.toString() ?? '',

      age: json['age']?.toString() ?? '',

      phone: json['phone']?.toString() ?? '',

      locationName: json['locationName']?.toString() ?? '',

      location: LatLng(
        double.tryParse(json['latitude']?.toString() ?? '') ?? 0.0,
        double.tryParse(json['longitude']?.toString() ?? '') ?? 0.0,
      ),

      lastseen: json['lastseen']?.toString() ?? '',

      report_id: json['report_id']?.toString(),
    );
  }
}
