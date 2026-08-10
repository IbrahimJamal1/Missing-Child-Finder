import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/loading/widget/actionbutton.dart';
import 'package:ai_safetrack/features/loading/widget/createqrcode.dart';
import 'package:ai_safetrack/features/loading/widget/headerloadpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: floatActionCreateQR(width, context),
      floatingActionButtonLocation:FloatingActionButtonLocation.endTop ,
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          SizedBox(height: 50),
          headerpage(width),
          SizedBox(height: 50.h),

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

          width > 700 ? SizedBox(height: 30.h):SizedBox(height: 60.h),

          actionbuttonloadpage(width, context),

          const Spacer(),

          Image.asset("images/welcomesreenimage.png"),
        ],
      ),
    );
  }
}
