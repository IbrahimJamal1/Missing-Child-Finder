import 'package:ai_safetrack/core/helpfunc/missingsinceago.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reportDetail({
  required BuildContext context,
  required DateTime? selectedDateTime,
  required TextEditingController mfSinceController,
  required String childStatus,
  required String personType,
  required ValueChanged<String> onChildStatusChanged,
  required ValueChanged<String> onPersonTypeChanged,
  required ValueChanged<DateTime> onDateChanged,
}) {
  final String statePersonLabel = switch (childStatus) {
    "Missing" => "Missing",
    "Found" => "Found",
    _ => "Accident",
  };

  final bool isAccident = childStatus == "Accident";

  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    child: Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Icon(Icons.report, color: Colors.blue),
              ),
              SizedBox(width: 12.w),
              Text(
                "Report Details",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 25.h),

          // Person Status Section
          Text(
            "Person Status",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),

          SegmentedButton<String>(
            segments: const [
              ButtonSegment(
                value: "Missing",
                icon: Icon(Icons.search),
                label: Text("Missing"),
              ),
              ButtonSegment(
                value: "Found",
                icon: Icon(Icons.check_circle),
                label: Text("Found"),
              ),
              ButtonSegment(
                value: "Accident",
                icon: Icon(Icons.warning_amber),
                label: Text("Accident"),
              ),
            ],
            selected: {childStatus},
            onSelectionChanged: (value) {
              onChildStatusChanged(value.first);
            },
          ),

          if (!isAccident) ...[
            SizedBox(height: 25.h),
            Text(
              "Person Type",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12.h),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: "Child",
                  icon: Icon(Icons.child_care),
                  label: Text("Child"),
                ),
                ButtonSegment(
                  value: "Adult",
                  icon: Icon(Icons.person),
                  label: Text("Adult"),
                ),
              ],
              selected: {personType},
              onSelectionChanged: (value) {
              
                onPersonTypeChanged(value.first);
              },
            ),
          ],

          SizedBox(height: 25.h),

          Text(
            "$statePersonLabel Since",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),

          TextFormField(
            controller: mfSinceController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: isAccident ? "Accident Time" : "Last Seen Time",
              prefixIcon: const Icon(Icons.access_time),
              suffixIcon: const Icon(Icons.keyboard_arrow_down),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 18.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: Colors.blue, width: 1.5),
              ),
            ),
            onTap: () async {
              final result = await missingSinceAgo(context);
              if (result != null) {
                onDateChanged(result.$1);
                mfSinceController.text = result.$2;
              }
            },
          ),
        ],
      ),
    ),
  );
}
