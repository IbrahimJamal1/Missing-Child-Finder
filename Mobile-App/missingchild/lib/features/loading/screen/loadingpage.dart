import 'package:ai_safetrack/core/api/storagetoken.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/home/screen/home.dart';
import 'package:ai_safetrack/features/loading/widget/actionbutton.dart';
import 'package:ai_safetrack/features/loading/widget/createqrcode.dart';
import 'package:ai_safetrack/features/loading/widget/headerloadpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    checkToken();
  }

  Future<void> checkToken() async {
    final token = await TokenStorage.getToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: floatActionCreateQR(width, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 30.h),

                headerpage(width),

                SizedBox(height: 25.h),

                Text(
                  "Together, We can",
                  style: TextStyle(
                    fontSize: AppFont.title(width),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0F172A),
                  ),
                ),

                SizedBox(height: 4.h),

                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: AppFont.title(width),
                      color: const Color(0xff0F172A),
                    ),
                    children: [
                      const TextSpan(text: "bring "),

                      TextSpan(
                        text: "hope",
                        style: TextStyle(
                          fontSize: AppFont.title(width),
                          color: const Color(0xff1E3A8A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const TextSpan(text: " back."),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                actionbuttonloadpage(width, context),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                "images/welcomesreenimage.png",
                width: width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
