import 'package:ai_safetrack/features/reports/widget/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_safetrack/core/services/callphone.dart';
import 'package:ai_safetrack/core/services/gataddressloca.dart';
import 'package:ai_safetrack/core/services/qrcode.dart';

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reporterName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        reportDate,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onCall ??
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                  decoration: BoxDecoration(
                    color: status == "Missing" ? Colors.red : Colors.green,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
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
                    fontSize: 15.sp,
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
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48.h,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showShareDialog(
                              context,
                              onShare: () {},
                            );
                          },
                          icon: Icon(Icons.share_rounded, size: 18.r),
                          label: Text(
                            "Share",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
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
                              childId: reporterName,
                              name: childName,
                              phone: phone,
                              age: age,
                              status: status,
                              description: description,
                              location: address,
                            );
                          },
                          icon: Icon(Icons.qr_code_rounded, size: 18.r),
                          label: Text(
                            "QR",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
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
                              fontSize: 14.sp,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        constraints: BoxConstraints(minHeight: 75.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: Colors.white, width: 1.5.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 42.r,
              height: 42.r,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: iconColor.withOpacity(.15), blurRadius: 8.r),
                ],
              ),
              child: Icon(icon, color: iconColor, size: 22.r),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xff64748B)),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1E293B),
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.r,
                  color: const Color(0xff94A3B8),
                ),
              ),
          ],
        ),
      ),
    );
  }
}