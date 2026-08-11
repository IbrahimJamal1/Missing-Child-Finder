import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';
import 'reportCard .dart';

class MissingAdult extends StatelessWidget {
  const MissingAdult({super.key});

  @override
  Widget build(BuildContext context) {
    List missingAdult = data.where((item) {
      return item["status"] == "Missing" &&
          item["personType"] == "Adult";
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: missingAdult.length,

      itemBuilder: (context, index) {
        final adult = missingAdult[index];

        return ReportCard(
          reporterName: adult["reporterName"],
          reporterImage: adult["reporterImage"],
          reportDate: adult["reportDate"],
          image: adult["image"],

          status: adult["status"],

          phone: adult["phone"],

          description: adult["description"],

          age: adult["age"],

          locationName: adult["locationName"],
          location: adult["location"],

          childName: adult["childName"],

          lastseen: adult["lastseen"],
        );
      },
    );
  }
}