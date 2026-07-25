
import 'package:flutter/material.dart';
import 'package:missingchild/features/reports/screens/accident.dart';
import 'package:missingchild/features/reports/screens/missingadult.dart';
import 'package:missingchild/features/reports/screens/missingchild.dart';

class Missing extends StatefulWidget {
  const Missing({super.key});

  @override
  State<Missing> createState() => _MissingState();
}

class _MissingState extends State<Missing> {
  int selectindec = 0;
  final List<Widget> bottomnavig = [
    const MissingAdult(),
    const MissingChild(),
    const Accident(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Missing Children",
          style: TextStyle(
            color: Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectindec,
        onDestinationSelected: (index) {
          setState(() {
            selectindec = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Adult",
          ),
          NavigationDestination(
            icon: Icon(Icons.child_care_outlined),
            selectedIcon: Icon(Icons.child_care),
            label: "Child",
          ),
          NavigationDestination(
            icon: Icon(Icons.car_crash_outlined),
            selectedIcon: Icon(Icons.car_crash),
            label: "Accident",
          ),
        ],
      ),

      body: bottomnavig.elementAt(selectindec),
    
    );
  }
}
