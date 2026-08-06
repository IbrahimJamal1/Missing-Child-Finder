import 'package:ai_safetrack/features/loading/widget/imagecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMobileLayout(
  int currentPage,

  PageController controller,
  List<Map<String, String>> pages, {
  required ValueChanged<int> refresh,
}) {
  return PageView.builder(
    controller: controller,
    itemCount: 100000,
    onPageChanged: (value) {
      refresh(value);
    },
    itemBuilder: (context, index) {
      final realIndex = index % pages.length;

      return Column(
        children: [
          Expanded(flex: 6, child: buildImageCard(pages[realIndex]["image"]!)),
          SizedBox(height: 20.h),
          Text(
            pages[realIndex]["title"]!,
            style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff0F172A),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              pages[realIndex]["desc"]!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget buildtabLayout(
  int currentPage,
  bool iswidth,
  PageController controller,
  List<Map<String, String>> pages, {
  required ValueChanged<int> refresh,
}) {
  return PageView.builder(
    controller: controller,
    itemCount: 100000,
    onPageChanged: (value) {
      refresh(value);
    },
    itemBuilder: (context, index) {
      final realIndex = index % pages.length;

      return Row(
        children: [
          Expanded(flex: 5, child: buildImageCard(pages[realIndex]["image"]!)),
          SizedBox(width: 30.w),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pages[realIndex]["title"]!,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0F172A),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(),
                  Text(
                    pages[realIndex]["desc"]!,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      height: 1.6,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

