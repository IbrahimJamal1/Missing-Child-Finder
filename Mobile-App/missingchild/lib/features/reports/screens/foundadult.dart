
import 'package:flutter/material.dart';
import 'package:missingchild/getdata.dart';
import 'reportCard .dart';

class Foundadult extends StatelessWidget {
  const Foundadult({super.key});
  @override
  Widget build(BuildContext context) {
    
    List foundchild = data.where((item) {
      return item["childStatus"] == "Found" && item["personType"]== "Adult" ;
    }).toList();


    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: foundchild.length,

      itemBuilder: (context, index) {

        final child = foundchild[index];


        return ReportCard(

          reporterName: child["reporterName"],
phone: child["childPhone"],
          reporterImage: child["reporterImage"],

          reportDate: child["reportDate"],

          image: child["image"],

          status: child["childStatus"],

          description: child["description"],

          age: child["childAge"],

          locationName: child["locationName"],

          location: child["location"], childName: '',

        );
      },
    );
  }
}