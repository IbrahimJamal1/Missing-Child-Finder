
import 'package:flutter/material.dart';
import 'package:missingchild/features/reports/screens/foundadult.dart';
import 'package:missingchild/features/reports/screens/foundchild.dart';

class Found extends StatefulWidget {
  const Found({super.key});

  @override
  State<Found> createState() => _FoundState();
}

class _FoundState extends State<Found> {
  int selectindec = 0;
  List FoundType = [const FoundChild(), Foundadult()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectindec,
        onDestinationSelected: (index) {
          setState(() {
            selectindec = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: const Icon(Icons.family_restroom_outlined),
            selectedIcon: const Icon(Icons.family_restroom),
            label: "Child",
          ),

          NavigationDestination(
            icon: const Icon(Icons.man_outlined),
            selectedIcon: const Icon(Icons.man),
            label: "Adult",
          ),
        ],
      ),

      body: FoundType.elementAt(selectindec),
    );
  }
}
