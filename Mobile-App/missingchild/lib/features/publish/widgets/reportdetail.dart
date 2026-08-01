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
  String statepersonlabel = childStatus == "Missing"
      ? "Missing"
      : childStatus == "Found"
      ? "Found"
      : "Accident"
      ;
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.report, color: Colors.blue),
              ),
              SizedBox(width: 12.w),
              Text(
                "Report Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 25.h),

          Text(
            "Person Status",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 12.h),

          SegmentedButton<String>(
            segments: [
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

          SizedBox(height: 25.h),

          Text(
            "Person Type",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          SegmentedButton<String>(
            segments: [
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

          SizedBox(height: 25.h),

          Text(
            "$statepersonlabel Since",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 12.h),

          TextFormField(
            controller: mfSinceController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Last Seen Time",
              prefixIcon: Icon(Icons.access_time),
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue, width: 1.5),
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
