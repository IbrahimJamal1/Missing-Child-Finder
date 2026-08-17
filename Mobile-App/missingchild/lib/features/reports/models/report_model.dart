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
 
}
