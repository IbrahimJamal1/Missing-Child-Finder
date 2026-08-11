
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//location age
class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        constraints: BoxConstraints(minHeight: 75.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: Colors.white, width: 1.5.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 42.r,
              height: 42.r,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: iconColor.withOpacity(.15), blurRadius: 8.r),
                ],
              ),
              child: Icon(icon, color: iconColor, size: 18.r),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppFont.caption(width),
                      color: const Color(0xff64748B),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppFont.caption(width),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1E293B),
                    ), 
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.r,
                  color: const Color(0xff94A3B8),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
