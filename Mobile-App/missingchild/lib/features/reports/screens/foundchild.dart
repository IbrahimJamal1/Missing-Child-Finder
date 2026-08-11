import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';
import 'reportCard .dart';

class FoundChild extends StatelessWidget {
  const FoundChild({super.key});

  @override
  Widget build(BuildContext context) {
    List foundChild = data.where((item) {
      return item["status"] == "Found" &&
          item["personType"] == "Child";
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: foundChild.length,

      itemBuilder: (context, index) {
        final child = foundChild[index];

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