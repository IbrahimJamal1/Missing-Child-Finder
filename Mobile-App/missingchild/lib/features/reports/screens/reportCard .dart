import 'dart:ui';

import 'package:ai_safetrack/core/services/callphone.dart';
import 'package:ai_safetrack/core/services/formatreportdate.dart';
import 'package:ai_safetrack/core/services/gataddressloca.dart';
import 'package:ai_safetrack/core/services/time_ago.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/reports/widget/actionbuttominpost.dart';
import 'package:ai_safetrack/features/reports/widget/infobuttonpost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final String? lastseen;

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
    required this.lastseen,
    this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDanger = status == "Missing" || status == "Accident";

    final Color statusColor = isDanger ? Colors.red : Colors.green;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 4.w, right: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.07),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 12.w, 12.h),
            child: Row(
              children: [
                // Profile Image
                Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffDBEAFE),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 23.r,
                    backgroundColor: Colors.grey.shade100,
                    backgroundImage: NetworkImage(reporterImage),
                  ),
                ),

                SizedBox(width: 12.w),

                // Name + Date
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      //user detail profile
                      Navigator.pushNamed(context, 'userprofile');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reporterName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppFont.body(width),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff0F172A),
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 14.r,
                              color: const Color(0xFF7B7A7A),
                            ),

                            SizedBox(width: 4.w),

                            Expanded(
                              child: Text(
                                formatReportDate(reportDate),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: AppFont.caption(width),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Call Button
                Material(
                  color: const Color(0xffEFF6FF),
                  shape: const CircleBorder(),
                  child: IconButton(
                    onPressed:
                        onCall ??
                        () {
                          makePhoneCall(phone);
                        },
                    icon: Icon(
                      Icons.phone_rounded,
                      color: const Color(0xff2563EB),
                      size: 20.r,
                    ),
                  ),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              //detailpost
            },

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: AspectRatio(
                      aspectRatio: 16 / 10,
                      child: Image.network(
                        image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade100,
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                size: 50.r,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Status
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 7.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(
                            color: statusColor.withOpacity(.3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isDanger
                                ? Icons.warning_rounded
                                : Icons.check_circle_rounded,
                            color: Colors.white,
                            size: 15.r,
                          ),

                          SizedBox(width: 5.w),

                          Text(
                            status,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: AppFont.caption(width),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7.h),

                // Status Sentence
                if (lastseen != null)
                  Text(
                    "$childName is $status • "
                    "${timeAgo(DateTime.parse(lastseen!))}",
                    style: TextStyle(
                      fontSize: AppFont.body(width),
                      height: 1.4,
                      color: const Color(0xff64748B),
                    ),
                  ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Expanded(
                      child: InfoCard(
                        title: "Age",
                        value: age,
                        icon: Icons.cake_rounded,
                        iconColor: const Color(0xff2563EB),
                        bgColor: const Color(0xffEFF6FF),
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: FutureBuilder<String>(
                        future: getAddressFromLatLng(
                          location.latitude,
                          location.longitude,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return InfoCard(
                              title: "Location",
                              value: "Loading...",
                              icon: Icons.location_on_rounded,
                              iconColor: const Color(0xffEF4444),
                              bgColor: const Color(0xffFEF2F2),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "map",
                                  arguments: location,
                                );
                              },
                            );
                          }

                          if (snapshot.hasError) {
                            return InfoCard(
                              title: "Location",
                              value: "Unknown",
                              icon: Icons.location_on_rounded,
                              iconColor: const Color(0xffEF4444),
                              bgColor: const Color(0xffFEF2F2),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "map",
                                  arguments: location,
                                );
                              },
                            );
                          }

                          return InfoCard(
                            title: "Location",
                            value: snapshot.data ?? "Unknown",
                            icon: Icons.location_on_rounded,
                            iconColor: const Color(0xffEF4444),
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

                SizedBox(height: 18.h),

                actionButtonPost(
                  context: context,
                  status: status,
                  description: description,
                  childName: childName,
                  age: age,
                  phone: phone,
                  reporterName: reporterName,
                  location: location,
                  lastseen:lastseen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
