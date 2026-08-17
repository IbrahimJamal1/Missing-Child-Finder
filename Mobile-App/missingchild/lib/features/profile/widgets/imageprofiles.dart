import 'package:ai_safetrack/core/helpfunc/bouns.dart';
import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageProfile({
  required bool imageType,
  required ImageService imageService,
  required VoidCallback refresh,
   final String? myname,
   final String? myemail,
   final String? phone,
   final String? imageurl,
   final String? coverpage,
}) {
  return SizedBox(
    height: 220.h,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Cover Image
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageService.coverprofile != null
                  ? FileImage(imageService.coverprofile!)
                  :  NetworkImage(coverpage??""),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Cover Camera
        if (imageType)
          Positioned(
            top: 10.h,
            right: 10.w,
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.white,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  await imageService.pickImage("coverprofile");
                  refresh();
                },
                icon: Icon(Icons.camera_alt, color: Colors.blue, size: 20.sp),
              ),
            ),
          ),

        // Profile Image
        Positioned(
          top: 70.h,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 132.r,
                height: 132.r,
                child: CircularProgressIndicator(
                  value: calculateBonus().clamp(0.0, 1.0),
                  strokeWidth: 5.w,
                ),
              ),

              CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 56.r,
                  backgroundImage: imageService.updateimageprofile != null
                      ? FileImage(imageService.updateimageprofile!)
                      :  NetworkImage(imageurl??""),
                ),
              ),

              if (imageType)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        await imageService.pickImage("updateimageprofile");
                        refresh();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
