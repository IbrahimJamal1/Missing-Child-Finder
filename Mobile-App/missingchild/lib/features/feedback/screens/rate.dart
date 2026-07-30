import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key});

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  int _selectedStars = 0;

  String _getRatingFeedback() {
    switch (_selectedStars) {
      case 1:
        return "We are sorry to hear that. Tell us how we can improve.";
      case 2:
        return "Thank you. We will work harder to make it better.";
      case 3:
        return "Glad you like it! We appreciate your support.";
      case 4:
        return "Awesome! We are thrilled to provide a good experience.";
      case 5:
        return "Wow! Thank you so much for the full support!";
      default:
        return "Tap a star to give your feedback. Your support helps us make the community safer.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Rate App",
          style: TextStyle(
            color: const Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 20.r,
                  offset: Offset(0, 10.h),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: const BoxDecoration(
                    color: Color(0xffFEF3C7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.star_rounded,
                    color: const Color(0xffD97706),
                    size: 50.r,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Enjoying AI-MIDS?",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1E293B),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  _getRatingFeedback(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff64748B),
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final int starValue = index + 1;
                    final bool isSelected = starValue <= _selectedStars;

                    return IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedStars = starValue;
                        });
                      },
                      iconSize: 35.r,
                      icon: Icon(
                        isSelected
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: isSelected
                            ? const Color(0xffF59E0B)
                            : const Color(0xffCBD5E1),
                      ),
                      splashRadius: 20.r,
                    );
                  }),
                ),
                SizedBox(height: 36.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: _selectedStars == 0
                              ? null
                              : () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Thank you for your rating!",
                                        style: TextStyle(fontSize: 14.sp),
                                      ),
                                      backgroundColor: const Color(0xff10B981),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1E3A8A),
                            disabledBackgroundColor: const Color(0xffE2E8F0),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: _selectedStars == 0
                                  ? const Color(0xff94A3B8)
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: const Color(0xffE2E8F0),
                              width: 1.5.w,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          child: Text(
                            "Maybe Later",
                            style: TextStyle(
                              color: const Color(0xff64748B),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}