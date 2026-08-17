import 'package:ai_safetrack/features/reports/models/report_model.dart';
import 'package:ai_safetrack/features/reports/screens/reportCard%20.dart';
import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';

class MissingAdult extends StatelessWidget {
  const MissingAdult({super.key});

  @override
  Widget build(BuildContext context) {
    final missingAdult = data.where((item) {
      return item["status"] == "Missing" && item["personType"] == "Adult";
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: missingAdult.length,
      itemBuilder: (context, index) {
        final adult = missingAdult[index];

        final report = ReportModel(
          reporterName: adult["reporterName"],
          reporterImage: adult["reporterImage"],
          reportDate: DateTime.parse(adult["reportDate"]),
          image: adult["image"],
          childName: adult["childName"],
          status: adult["status"],
          description: adult["description"],
          age: adult["age"],
          phone: adult["phone"],
          locationName: adult["locationName"],
          location: adult["location"],

          lastseen: adult["lastseen"],
          report_id: adult["report_id"],
        );

        return ReportCard(report: report);
      },
    );
  }
}
