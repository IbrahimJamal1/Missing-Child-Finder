import 'package:ai_safetrack/features/about/widgets/aboutcard.dart';
import 'package:ai_safetrack/features/about/widgets/featurerow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "About AI-MIDS",
          style: TextStyle(
            color: const Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: const Color(0xffEFF6FF),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Icon(
                      Icons.diversity_3_rounded,
                      color: const Color(0xff3B82F6),
                      size: 60.r,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "AI-MIDS",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xff1E293B),
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      color: const Color(0xff94A3B8),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            buildAboutCard(
              title: "Our Mission",
              icon: Icons.auto_awesome_rounded,
              iconColor: const Color(0xff3B82F6),
              description:
                  "AI-MIDS is an advanced medical imaging and smart disease detection ecosystem designed to empower healthcare professionals. By combining cutting-edge Deep Learning architectures with community safety tools, we aim to deliver fast, accurate, and accessible diagnostic assistance, making healthcare smarter and more unified.",
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 12.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Core Capabilities",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1E293B),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  buildFeatureRow(
                    Icons.psychology_rounded,
                    "AI Diagnostics",
                    " deep learning models for accurate classification.",
                  ),
                  buildFeatureRow(
                    Icons.location_on_rounded,
                    "Geolocated Reports",
                    "Mapping emergency accidents and missing reports in real-time.",
                  ),
                  buildFeatureRow(
                    Icons.qr_code_scanner_rounded,
                    "Secure QR Ecosystem",
                    "Instant and secure information sharing via smart identifiers.",
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "© 2026 AI-MIDS Project Team. All Rights Reserved.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff94A3B8),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}