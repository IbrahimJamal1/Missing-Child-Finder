import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_safetrack/core/services/currentlocation.dart';

class Showmap extends StatefulWidget {
  const Showmap({super.key});

  @override
  State<Showmap> createState() => _ShowmapState();
}

class _ShowmapState extends State<Showmap> {
  GoogleMapController? mapController;

  LatLng? currentLocation;
  LatLng? selectedLocation;

  bool loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getArgumentLocation();
    });
  }

  void getArgumentLocation() {
    final location = ModalRoute.of(context)?.settings.arguments as LatLng?;

    if (location != null) {
      setState(() {
        selectedLocation = location;
        loading = false;
      });
    } else {
      getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await determinePosition();

      currentLocation = LatLng(position.latitude, position.longitude);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst("Exception: ", "")),
          backgroundColor: Colors.red,
        ),
      );

      setState(() {
        loading = false;
      });

      return;
    }

    if (!mounted) return;

    setState(() {
      loading = false;
    });
  }

  LatLng? get mapLocation {
    return selectedLocation ?? currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xff3B82F6)),
            )
          : mapLocation == null
          ? Center(
              child: Text(
                "Cannot retrieve location data",
                style: TextStyle(
                  color: const Color(0xff64748B),
                  fontSize: 16.sp,
                ),
              ),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: mapLocation!,
                zoom: 16,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                mapController = controller;
              },
              markers: {
                Marker(
                  markerId: const MarkerId("location"),
                  position: mapLocation!,
                  infoWindow: InfoWindow(
                    title: selectedLocation != null
                        ? "Target Location"
                        : "My Current Location",
                  ),
                ),
              },
              circles: {
                Circle(
                  circleId: const CircleId("radius"),
                  center: mapLocation!,
                  radius: 70,
                  fillColor: const Color(0xff3B82F6).withOpacity(0.15),
                  strokeColor: const Color(0xff3B82F6),
                  strokeWidth: 1,
                ),
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (mapLocation != null) {
            Navigator.pop(context, mapLocation);
          }
        },
        backgroundColor: const Color(0xff1E3A8A),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        icon: Icon(Icons.check_circle_rounded, color: Colors.white, size: 20.r),
        label: Text(
          "Confirm Location",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
