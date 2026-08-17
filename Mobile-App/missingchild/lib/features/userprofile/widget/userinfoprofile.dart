import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/profile/widgets/imageprofiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget userinfoProfile(width) {
  return SliverToBoxAdapter(
    child: Column(
      children: [
        imageProfile(
          imageurl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwtqGSZwRv2nrZVgIKq92YqFvf41wDyb7ggvsu9I_t5Q&s=10",
          coverpage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfTbvC_TEn8gHAjGO8B_g_fvHg15HO5LCKaIWZPKuh9g&s=10",
          imageType: false,
          imageService: ImageService(),
          refresh: () {},
        ),
        Text(
          "User name",
          style: TextStyle(
            fontSize: AppFont.body(width),
            fontWeight: FontWeight.bold,
            color: const Color(0xff1E293B),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          "email@gmail.com",
          style: TextStyle(
            color: const Color(0xff64748B),
            fontSize: AppFont.body(width),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Posts",
              style: TextStyle(
                fontSize: AppFont.header(width),
                fontWeight: FontWeight.w800,
                color: const Color(0xff1E293B),
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    ),
  );
}
