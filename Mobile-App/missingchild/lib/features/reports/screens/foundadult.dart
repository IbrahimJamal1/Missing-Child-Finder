import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';
import 'reportCard .dart';

class Foundadult extends StatelessWidget {
  const Foundadult({super.key});

  @override
  Widget build(BuildContext context) {
    List foundchild = data.where((item) {
      return item["status"] == "Found" &&
          item["personType"] == "Adult";
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: foundchild.length,
      itemBuilder: (context, index) {
        final child = foundchild[index];

        return ReportCard(
          reporterName: child["reporterName"],
          reporterImage: child["reporterImage"],
          phone: child["phone"],
          reportDate: child["reportDate"],
          image: child["image"],
          status: child["status"],
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