import 'package:ai_safetrack/features/about/widgets/aboutcard.dart';
import 'package:ai_safetrack/features/about/widgets/featurerow.dart';
import 'package:flutter/material.dart';

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
        title: const Text(
          "About AI-MIDS",
          style: TextStyle(
            color: Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xffEFF6FF),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.diversity_3_rounded,
                      color: Color(0xff3B82F6),
                      size: 60,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "AI-MIDS",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff1E293B),
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      color: Color(0xff94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),

            buildAboutCard(
              title: "Our Mission",
              icon: Icons.auto_awesome_rounded,
              iconColor: const Color(0xff3B82F6),
              description:
                  "AI-MIDS is an advanced medical imaging and smart disease detection ecosystem designed to empower healthcare professionals. By combining cutting-edge Deep Learning architectures with community safety tools, we aim to deliver fast, accurate, and accessible diagnostic assistance, making healthcare smarter and more unified.",
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Core Capabilities",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1E293B),
                    ),
                  ),
                  const SizedBox(height: 16),
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

            const SizedBox(height: 30),

            const Text(
              "© 2026 AI-MIDS Project Team. All Rights Reserved.",
              style: TextStyle(
                color: Color(0xff94A3B8),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
