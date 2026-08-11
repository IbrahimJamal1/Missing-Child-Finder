import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';
import 'reportCard .dart';

class MissingChild extends StatelessWidget {
  const MissingChild({super.key});

  @override
  Widget build(BuildContext context) {
    List missingChild = data.where((item) {
      return item["status"] == "Missing" &&
          item["personType"] == "Child";
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: missingChild.length,

      itemBuilder: (context, index) {
        final child = missingChild[index];

        return ReportCard(
          reporterName: child["reporterName"],
          reporterImage: child["reporterImage"],
          reportDate: child["reportDate"],
          image: child["image"],
          status: child["status"],

          
          phone: child["phone"],

          description: child["description"],

         
          age: child["age"],

          locationName: child["locationName"],
          location: child["location"],

         
          childName: child["childName"],

         
          lastseen: child["lastseen"],
        );
      },
    );
  }
}