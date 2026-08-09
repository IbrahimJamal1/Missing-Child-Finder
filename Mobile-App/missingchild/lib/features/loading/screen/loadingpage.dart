import 'package:ai_safetrack/features/loading/widget/actionbutton.dart';
import 'package:ai_safetrack/features/loading/widget/createqrcode.dart';
import 'package:ai_safetrack/features/loading/widget/screenlaayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<Map<String, String>> pages = const [
    {
      "image": "images/onboarding3.jpg",
      "title": "Reunite Families",
      "desc":
          "Helping bring missing children home by connecting reports with real-time location data.",
    },
    {
      "image": "images/onboarding2.jpg",
      "title": "Instant Reporting",
      "desc":
          "Publish verified emergency reports immediately to reach nearby community members.",
    },
    {
      "image": "images/onboarding1.png",
      "title": "Safe & Reliable",
      "desc":
          "A secure network designed to protect child identity while maximizing search efficiency.",
    },
  ];

  int currentPage = 1000;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: floatActionCreateQR(width,context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffF8FAFC), Color(0xffEEF4FF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = MediaQuery.of(context).size.width;
                  // ignore: unused_local_variable
                  final height = MediaQuery.of(context).size.height;
                  bool isWideScreen = width >= 700; //tablet

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWideScreen ? 5.w : 10.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Missing Child Finder",
                          style: TextStyle(
                            fontSize: isWideScreen ? 15.sp : 17.sp,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xff0F172A),
                          ),
                        ),
                        isWideScreen
                            ? SizedBox(height: 4.h)
                            : SizedBox(height: 6.h),
                        Text(
                          "Together we bring persons home",
                          style: TextStyle(
                            color: const Color(0xFF5E5E5E),
                            fontSize: isWideScreen ? 12.sp : 15.sp,
                          ),
                        ),
                        isWideScreen
                            ? SizedBox(height: 0.h)
                            : SizedBox(height: 6.h),
                        Expanded(
                          child: isWideScreen
                              ? buildtabLayout(
                                  currentPage,
                                  isWideScreen,
                                  controller,
                                  pages,
                                  refresh: (value) {
                                    setState(() {
                                      currentPage = value;
                                    });
                                  },
                                )
                              : buildMobileLayout(
                                  currentPage,

                                  controller,
                                  pages,
                                  refresh: (value) {
                                    setState(() {
                                      currentPage = value;
                                    });
                                  },
                                ),
                        ),

                        isWideScreen
                            ? SizedBox(height: 0.h)
                            : SizedBox(height: 10.h),

                        _buildPageIndicator(),

                        SizedBox(height: 20.h),
                        buildActionButtons(isWideScreen, context),
                        isWideScreen
                            ? SizedBox(height: 4.h)
                            : SizedBox(height: 10.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: currentPage % pages.length == index ? 28.w : 10.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: currentPage % pages.length == index
                ? const Color(0xff2563EB)
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      ),
    );
  }
}
