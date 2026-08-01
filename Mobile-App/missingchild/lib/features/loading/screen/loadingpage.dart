import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final pages = [
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
  late Timer timer;
  late PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController(initialPage: currentPage);

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentPage++;

      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffF8FAFC), Color(0xffEEF4FF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "login");
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: const Color(0xff2563EB),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Missing Child Finder",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xff0F172A),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Together we bring children home",
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                ),
                SizedBox(height: 30.h),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: 100000,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      final realIndex = index % pages.length;
                      return Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.08),
                                    blurRadius: 25.r,
                                    offset: Offset(0, 10.h),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.r),
                                child: Image.asset(
                                  pages[realIndex]["image"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            pages[realIndex]["title"]!,
                            style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff0F172A),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Text(
                              pages[realIndex]["desc"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                height: 1.6,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: currentPage % pages.length == index ? 28.w : 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: currentPage % pages.length == index
                            ? const Color(0xff2563EB)
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'publish');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffDC2626),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                    ),
                    child: Text(
                      "Publish Report",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(double.infinity, 54.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 54.h),
                          backgroundColor: const Color(0xff2563EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
