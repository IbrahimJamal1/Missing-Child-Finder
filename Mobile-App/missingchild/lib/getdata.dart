import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<Map<String, dynamic>> data = [
  {
    "reporterName": "Omar Adel",
    "reporterImage": "https://i.pravatar.cc/150?img=3",
    "reportDate": "2026-06-03T14:20:00",
    "image": "https://picsum.photos/400/300?3",
    "childName": "Youssef Ali",
    "phone": "01033333333",
    "age": "11",
    "description": "Green jacket and jeans.",
    "locationName": "Alexandria",
    "location": const LatLng(31.2001, 29.9187),
    "status": "Found",
    "personType": "Child",
    "lastseen": "2025-06-03T14:10:00",
  },

  // =========================
  // Missing Child
  // =========================
  {
    "reporterName": "Ahmed Mohamed",
    "reporterImage": "https://i.pravatar.cc/150?img=12",
    "reportDate": "2026-06-05T10:30:00",
    "image": "https://picsum.photos/400/300?4",
    "childName": "Adam Ahmed",
    "phone": "01044444444",
    "age": "8",
    "description": "Wearing a blue T-shirt and black pants.",
    "locationName": "Cairo",
    "location": const LatLng(30.0444, 31.2357),
    "status": "Missing",
    "personType": "Child",
    "lastseen": "2026-06-05T09:45:00",
  },

  // =========================
  // Found Adult
  // =========================
  {
    "reporterName": "Mahmoud Hassan",
    "reporterImage": "https://i.pravatar.cc/150?img=15",
    "reportDate": "2026-06-07T16:15:00",
    "image": "https://picsum.photos/400/300?5",
    "childName": "Hassan Mahmoud",
    "phone": "01055555555",
    "age": "35",
    "description": "Wearing a gray jacket and black trousers.",
    "locationName": "Giza",
    "location": const LatLng(30.0131, 31.2089),
    "status": "Found",
    "personType": "Adult",
    "lastseen": "2026-06-07T15:30:00",
  },

  // =========================
  // Missing Adult
  // =========================
  {
    "reporterName": "Sara Ali",
    "reporterImage": "https://i.pravatar.cc/150?img=20",
    "reportDate": "2026-06-08T12:00:00",
    "image": "https://picsum.photos/400/300?6",
    "childName": "Ali Hassan",
    "phone": "01066666666",
    "age": "42",
    "description": "Wearing a white shirt and blue jeans.",
    "locationName": "Menoufia",
    "location": const LatLng(30.5526, 30.9876),
    "status": "Missing",
    "personType": "Adult",
    "lastseen": "2026-06-08T11:20:00",
  },
  {
    "reporterName": "Sara Ali",
    "reporterImage": "https://i.pravatar.cc/150?img=20",
    "reportDate": "2026-06-08T12:00:00",
    "image": "https://picsum.photos/400/300?6",
    "childName": "Ali Hassan",
    "phone": "01066666666",
    "age": "42",
    "description": "Wearing a white shirt and blue jeans.",
    "locationName": "Menoufia",
    "location": const LatLng(30.5526, 30.9876),
    "status": "Accident",
    "personType": "Adult",
    "lastseen": "2026-06-08T11:20:00",
  },
];
