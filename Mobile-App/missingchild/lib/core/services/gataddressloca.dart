import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromLatLng(
  double latitude,
  double longitude,
) async {
  try {
    final placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );

    if (placemarks.isEmpty) {
      return "Unknown Location";
    }

    final place = placemarks.first;

    final addressParts = [
      if (place.street?.isNotEmpty ?? false)
        place.street!,
      if (place.subLocality?.isNotEmpty ?? false)
        place.subLocality!,
      if (place.locality?.isNotEmpty ?? false)
        place.locality!,
      if (place.administrativeArea?.isNotEmpty ?? false)
        place.administrativeArea!,
    ];

    return addressParts.isNotEmpty
        ? addressParts.join(', ')
        : "Unknown Location";
  } catch (e) {
    debugPrint("Geocoding error: $e");
    return "Unknown address";
  }
}