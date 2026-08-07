import 'package:ai_safetrack/core/helpfunc/missingsinceago.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
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
  double width = MediaQuery.of(context).size.width;

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
                style: TextStyle(
                  fontSize: AppFont.header(width),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 25.h),

          Text(
            "$statePersonLabel Status",
            style: TextStyle(
              fontSize: AppFont.subtitle(width),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),

          SegmentedButton<String>(
            segments: [
              ButtonSegment(
                value: "Missing",
                icon: const Icon(Icons.search),
                label: Text(
                  "Missing",
                  style: TextStyle(fontSize: AppFont.caption(width)),
                ),
              ),
              ButtonSegment(
                value: "Found",
                icon: const Icon(Icons.check_circle),
                label: Text(
                  "Found",
                  style: TextStyle(fontSize: AppFont.caption(width)),
                ),
              ),
              ButtonSegment(
                value: "Accident",
                icon: const Icon(Icons.warning_amber),
                label: Text(
                  "Accident",
                  style: TextStyle(fontSize: AppFont.caption(width)),
                ),
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
              "$statePersonLabel Type",
              style: TextStyle(
                fontSize: AppFont.subtitle(width),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.h),
            SegmentedButton<String>(
              segments: [
                ButtonSegment(
                  value: "Child",
                  icon: const Icon(Icons.child_care),
                  label: Text(
                    "Child",
                    style: TextStyle(fontSize: AppFont.caption(width)),
                  ),
                ),
                ButtonSegment(
                  value: "Adult",
                  icon: const Icon(Icons.person),
                  label: Text(
                    "Adult",
                    style: TextStyle(fontSize: AppFont.caption(width)),
                  ),
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
            style: TextStyle(
              fontSize: AppFont.subtitle(width),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),

          TextFormField(
            controller: mfSinceController,
            readOnly: true,
            style: TextStyle(fontSize: AppFont.body(width)),
            decoration: InputDecoration(
              labelText: isAccident ? "Accident Time" : "Last Seen Time",
              labelStyle: TextStyle(fontSize: AppFont.body(width)),
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