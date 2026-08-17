import 'package:ai_safetrack/features/reports/models/report_model.dart';
import 'package:ai_safetrack/features/reports/screens/reportCard%20.dart';
import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';

class Foundadult extends StatelessWidget {
  const Foundadult({super.key});

  @override
  Widget build(BuildContext context) {
    final foundadult = data.where((item) {
      return item["status"] == "Found" && item["personType"] == "Adult";
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: foundadult.length,
      itemBuilder: (context, index) {
        final child = foundadult[index];

        final report = ReportModel(
          reporterName: child["reporterName"],
          reporterImage: child["reporterImage"],
          reportDate: DateTime.parse(child["reportDate"]),
          image: child["image"],
          childName: child["childName"],
          status: child["status"],
          description: child["description"],
          age: child["age"],
          phone: child["phone"],
          locationName: child["locationName"],
          location: child["location"],

          lastseen: child["lastseen"],
          report_id: child["report_id"],
        );

        return ReportCard(report: report);
      },
    );
  }
}
