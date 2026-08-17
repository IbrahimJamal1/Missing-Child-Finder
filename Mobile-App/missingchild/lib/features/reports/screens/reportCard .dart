import 'package:ai_safetrack/core/services/gataddressloca.dart';
import 'package:ai_safetrack/core/services/time_ago.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/detailspost/screen/detailsposthome.dart';
import 'package:ai_safetrack/features/reports/models/report_model.dart';
import 'package:ai_safetrack/features/reports/widget/actionbuttominpost.dart';
import 'package:ai_safetrack/features/reports/widget/infobuttonpost.dart';
import 'package:ai_safetrack/features/reports/widget/inforeportdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportCard extends StatelessWidget {
  final ReportModel report;

  const ReportCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDanger =
        report.status == "Missing" || report.status == "Accident";

    final Color statusColor = isDanger ? Colors.red : Colors.green;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 4.w, right: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .07),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          //info report
          imforeportdata(report,context,width),

         
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailspost(report: report),
                ),
              );
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
                        report.image,
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
                            report.status,
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
                Text(
                  "${report.childName} is ${report.status} • "
                  "${timeAgo(DateTime.parse(report.lastseen))}",
                  style: TextStyle(
                    fontSize: AppFont.body(width),
                    height: 1.4,
                    color: const Color(0xff64748B),
                  ),
                ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    // Age
                    Expanded(
                      child: InfoCard(
                        title: "Age",
                        value: report.age,
                        icon: Icons.cake_rounded,
                        iconColor: const Color(0xff2563EB),
                        bgColor: const Color(0xffEFF6FF),
                      ),
                    ),

                    SizedBox(width: 10.w),

                    // Location
                    Expanded(
                      child: FutureBuilder<String>(
                        future: getAddressFromLatLng(
                          report.location.latitude,
                          report.location.longitude,
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
                                  arguments: report.location,
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
                                arguments: report.location,
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
                  report_id:report.report_id,
                  context: context,
                  status: report.status,
                  description: report.description,
                  childName: report.childName,
                  age: report.age,
                  phone: report.phone,
                  reporterName: report.reporterName,
                  location: report.location,
                  lastseen: report.lastseen,
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
