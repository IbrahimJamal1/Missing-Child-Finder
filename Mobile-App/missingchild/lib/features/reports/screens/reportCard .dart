import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/reports/widget/actionbuttominpost.dart';
import 'package:ai_safetrack/features/reports/widget/infobuttonpost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_safetrack/core/services/callphone.dart';
import 'package:ai_safetrack/core/services/gataddressloca.dart';

class ReportCard extends StatelessWidget {
  final String reporterName;
  final String reporterImage;
  final String reportDate;
  final String image;
  final String status;
  final String description;
  final String childName;
  final String age;
  final String phone;
  final String locationName;
  final LatLng location;
  final VoidCallback? onCall;
  // final last

  const ReportCard({
    super.key,
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
    this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: NetworkImage(reporterImage),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'userprofile');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reporterName,
                          style: TextStyle(
                            fontSize: AppFont.body(width),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          reportDate,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: AppFont.caption(width),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed:
                        onCall ??
                        () {
                          makePhoneCall(phone);
                        },
                    icon: Icon(Icons.phone, color: Colors.blue, size: 20.r),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                          child: Icon(Icons.image_not_supported, size: 50.r),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15.h,
                right: 30.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 7.h,
                  ),
                  decoration: BoxDecoration(
                    color: status == "Missing" ? Colors.red : Colors.green,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFont.caption(width),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    fontSize: AppFont.body(width),
                    height: 1.5,
                    color: const Color(0xff475569),
                  ),
                ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Expanded(
                      child: InfoCard(
                        title: "Age",
                        value: age,
                        icon: Icons.cake,
                        iconColor: Colors.blue,
                        bgColor: const Color(0xffEFF6FF),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: FutureBuilder<String>(
                        future: getAddressFromLatLng(
                          location.latitude,
                          location.longitude,
                        ),
                        builder: (context, snapshot) {
                          String address = "Loading...";

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            address = snapshot.data ?? "Unknown location";
                          }
                          return InfoCard(
                            title: "Location",
                            value: address,
                            icon: Icons.location_on,
                            iconColor: Colors.red,
                            bgColor: const Color(0xffFEF2F2),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "map",
                                arguments: location,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                actionButtonPost(
                  context,
                  status,
                  description,
                  childName,
                  age,
                  phone,
                  description,
                  childName,
                  reporterName,
                  location,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
