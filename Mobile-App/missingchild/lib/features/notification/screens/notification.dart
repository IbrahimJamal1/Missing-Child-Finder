import 'package:flutter/material.dart';
import 'package:ai_safetrack/core/services/time_ago.dart';
import 'package:ai_safetrack/getdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
            color: const Color(0xff1E3A8A),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.r),
        itemCount: 5,
        itemBuilder: (context, index) {
          final item = data[index];
          final bool isMissing = item["childStatus"] == "Missing";
          final bool isAccident = item["childStatus"] == "Accident";

          return Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.r),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.12),
                      blurRadius: 12.r,
                      offset: Offset(0, 5.h),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 34.r,
                          backgroundImage: NetworkImage(item["image"]),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: isMissing || isAccident
                                  ? Colors.red
                                  : Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2.w),
                            ),
                            child: Icon(
                              isMissing ? Icons.person_search : Icons.check,
                              color: Colors.white,
                              size: 14.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["reporterName"],
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff0F172A),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            item["description"],
                            style: TextStyle(
                              color: const Color(0xff64748B),
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14.r,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                timeAgo(DateTime.parse(item["reportDate"])),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 10.r,
                      height: 10.r,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}