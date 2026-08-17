import 'package:ai_safetrack/core/services/callphone.dart';
import 'package:ai_safetrack/core/services/time_ago.dart';
import 'package:ai_safetrack/features/detailspost/widget/buildInfoChaild.dart';
import 'package:ai_safetrack/features/detailspost/widget/imagechaild.dart';
import 'package:ai_safetrack/features/reports/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ai_safetrack/core/services/gataddressloca.dart';

class Detailspost extends StatelessWidget {
  final ReportModel report;

  const Detailspost({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final bool isMissing = report.status.toLowerCase().contains('missing');

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          imagechaild(context, report),

          // ================= BODY =================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // ================= NAME + STATUS =================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Expanded(
                        child: Text(
                          report.childName,

                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),

                        decoration: BoxDecoration(
                          color: isMissing
                              ? const Color(0xFFFEF2F2)
                              : const Color(0xFFF0FDF4),

                          borderRadius: BorderRadius.circular(20.r),

                          border: Border.all(
                            color: isMissing
                                ? const Color(0xFFFCA5A5)
                                : const Color(0xFF86EFAC),
                          ),
                        ),

                        child: Text(
                          report.status,

                          style: TextStyle(
                            color: isMissing
                                ? const Color(0xFFDC2626)
                                : const Color(0xFF16A34A),

                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // ================= INFO CARD =================
                  Container(
                    padding: EdgeInsets.all(16.r),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(16.r),

                      border: Border.all(color: const Color(0xFFE2E8F0)),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F172A).withOpacity(0.03),

                          blurRadius: 10,

                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        // Age
                        buildinfochailddata(
                          icon: Icons.cake_rounded,
                          iconColor: const Color(0xFF8B5CF6),
                          label: "Age",
                          value: "${report.age} years old",
                        ),

                        Divider(height: 24.h, color: const Color(0xFFF1F5F9)),

                        // Phone
                        buildinfochailddata(
                          icon: Icons.phone_rounded,
                          iconColor: const Color(0xFF10B981),
                          label: "Contact",
                          value: report.phone,
                        ),

                        Divider(height: 24.h, color: const Color(0xFFF1F5F9)),

                        buildinfochailddata(
                          icon: Icons.timelapse,
                          iconColor: const Color(0xFF10B981),
                          label: "lastseen",
                          value: timeAgo(DateTime.parse(report.lastseen)),
                        ),

                        Divider(height: 24.h, color: const Color(0xFFF1F5F9)),

                        // Location
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "map",
                              arguments: report.location,
                            );
                          },

                          child: FutureBuilder<String>(
                            future: getAddressFromLatLng(
                              report.location.latitude,
                              report.location.longitude,
                            ),

                            builder: (context, snapshot) {
                              return buildinfochailddata(
                                icon: Icons.location_on_rounded,

                                iconColor: const Color(0xFFEF4444),

                                label: "Last Seen Location",

                                value: snapshot.data ?? "Loading...",
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // ================= DESCRIPTION =================
                  Text(
                    "Description Details",

                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Container(
                    width: double.infinity,

                    padding: EdgeInsets.all(16.r),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(16.r),

                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),

                    child: Text(
                      report.description,

                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF475569),
                        height: 1.6,
                      ),
                    ),
                  ),

                  SizedBox(height: 28.h),

                  // ================= CALL BUTTON =================
                  ElevatedButton.icon(
                    onPressed: () {
                      makePhoneCall(report.phone);
                    },

                    icon: const Icon(
                      Icons.phone_forwarded_rounded,
                      color: Colors.white,
                    ),

                    label: Text(
                      "Call ${report.phone}",

                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),

                      minimumSize: Size(double.infinity, 52.h),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),

                      elevation: 0,
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
