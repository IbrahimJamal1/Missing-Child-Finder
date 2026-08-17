import 'package:ai_safetrack/features/reports/models/report_model.dart';
import 'package:ai_safetrack/features/reports/screens/reportCard%20.dart';
import 'package:ai_safetrack/features/userprofile/widget/userinfoprofile.dart';
import 'package:ai_safetrack/getdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          userinfoProfile(width),

          SliverLayoutBuilder(
            builder: (context, constraints) {
              return SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final child = data[index];

                    return ReportCard(
                      report: ReportModel(
                        reporterName: child["reporterName"],
                        reporterImage: child["reporterImage"],
                        reportDate: DateTime.parse(child["reportDate"]),
                        image: child["image"],
                        childName: child["childName"],
                        status: child["status"],
                        description: child["description"],
                        age: child["age"],
                        phone: child["phone"],
                        locationName: child["locationName"],
                        location: child["location"],
                        lastseen: child["lastseen"],
                        report_id: child["report_id"],
                      ),
                    );
                  }, childCount: 3),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 14.h,
                    crossAxisSpacing: 14.w,
                    childAspectRatio: .60,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
