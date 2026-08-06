import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromLatLng(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks;
    try {
      placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
    }catch (e) {
      print(e);
      return "Unknown address";
    }

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;

      List<String> addressParts = [
        if (place.street != null && place.street!.isNotEmpty) place.street!,
        if (place.subLocality != null && place.subLocality!.isNotEmpty)
          place.subLocality!,
        if (place.locality != null && place.locality!.isNotEmpty)
          place.locality!,
        if (place.administrativeArea != null &&
            place.administrativeArea!.isNotEmpty)
          place.administrativeArea!,
      ];

      return addressParts.isNotEmpty
          ? addressParts.join(', ')
          : "Unknown Location";
    }
    return "Unknown Location";
  } catch (e) {
    return '$e';
  }
}
