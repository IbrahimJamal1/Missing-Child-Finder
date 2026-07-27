import 'package:flutter/material.dart';
import 'package:ai_safetrack/features/reports/screens/accident.dart';
import 'package:ai_safetrack/features/reports/screens/missingadult.dart';
import 'package:ai_safetrack/features/reports/screens/missingchild.dart';

class Missing extends StatefulWidget {
  const Missing({super.key});

  @override
  State<Missing> createState() => _MissingState();
}

class _MissingState extends State<Missing> {
  int selectIndex = 0;

  final List<Widget> bottomNavPages = const [
    MissingAdult(),
    MissingChild(),
    Accident(),
  ];


  String get _appBarTitle {
    switch (selectIndex) {
      case 0:
        return "Missing Adult";
      case 1:
        return "Missing Child";
      case 2:
        return "Accident Report";
      default:
        return "Reports";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          _appBarTitle, 
          style: const TextStyle(
            color: Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),

      
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: NavigationBar(
            height: 65,
            elevation: 0,
            backgroundColor: Colors.white,
            indicatorColor: const Color(0xffDBEAFE),
            selectedIndex: selectIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded, color: Color(0xff64748B)),
                selectedIcon: Icon(Icons.person_rounded, color: Color(0xff2563EB)),
                label: "Adult",
              ),
              NavigationDestination(
                icon: Icon(Icons.child_care_outlined, color: Color(0xff64748B)),
                selectedIcon: Icon(Icons.child_care_rounded, color: Color(0xff2563EB)),
                label: "Child",
              ),
              NavigationDestination(
                icon: Icon(Icons.car_crash_outlined, color: Color(0xff64748B)),
                selectedIcon: Icon(Icons.car_crash_rounded, color: Color(0xff2563EB)),
                label: "Accident",
              ),
            ],
          ),
        ),
      ),

      body: IndexedStack(
        index: selectIndex,
        children: bottomNavPages,
      ),
    );
  }
}