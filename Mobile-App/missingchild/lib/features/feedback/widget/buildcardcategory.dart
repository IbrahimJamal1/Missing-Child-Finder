import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCategoryCard({
  required double width,
  required String category,
  required IconData icon,
  required String selectedCategory,
  required ValueChanged<String> onSelect,
}) {
  final bool isSelected = selectedCategory == category;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeInOut,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSelect(category),
        borderRadius: BorderRadius.circular(14.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffEFF6FF) : Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: isSelected ? const Color(0xff2563EB) : const Color(0xffE2E8F0),
              width: isSelected ? 1.5.w : 1.w,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xff2563EB).withAlpha(20),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? const Color(0xff2563EB) : const Color(0xff64748B),
                size: 20.r,
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Text(
                  category,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppFont.body(width),
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    color: isSelected ? const Color(0xff2563EB) : const Color(0xff64748B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}