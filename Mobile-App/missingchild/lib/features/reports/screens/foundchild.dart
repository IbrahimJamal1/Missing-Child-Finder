import 'package:flutter/material.dart';
import 'package:ai_safetrack/getdata.dart';
import 'reportCard .dart';

class FoundChild extends StatelessWidget {
  const FoundChild({super.key});

  @override
  Widget build(BuildContext context) {

    List foundchild = data.where((item) {
      return item["childStatus"] == "Found" && item["personType"]== "Child" ;
    }).toList();


    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: foundchild.length,

      itemBuilder: (context, index) {

        final child = foundchild[index];


        return ReportCard(

          reporterName: child["reporterName"],

          reporterImage: child["reporterImage"],

          reportDate: child["reportDate"],

          image: child["image"],

          status: child["childStatus"],
phone: child["childPhone"],
          description: child["description"],

          age: child["childAge"],

          locationName: child["locationName"],

          location: child["location"], childName: '',

        );
      },
    );
  }
}