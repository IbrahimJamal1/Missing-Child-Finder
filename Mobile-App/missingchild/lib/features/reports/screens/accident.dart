import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';
import 'reportCard .dart';

class Accident extends StatelessWidget {
  const Accident({super.key});

  @override
  Widget build(BuildContext context) {
    List foundchild = data.where((item) {
      return item["status"] == "Accident";
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: foundchild.length,
      itemBuilder: (context, index) {
        final child = foundchild[index];

        return ReportCard(
          reporterName: child["reporterName"],
          phone: child["phone"],
          childName: child["childName"],
          reporterImage: child["reporterImage"],
          reportDate: child["reportDate"],
          image: child["image"],
          status: child["status"],
          description: child["description"],
          age: child["age"],
          locationName: child["locationName"],
          location: child["location"],
          lastseen: child["lastseen"],
        );
      },
    );
  }
}