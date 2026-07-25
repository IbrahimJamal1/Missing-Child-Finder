import 'package:flutter/material.dart';
import 'package:missingchild/features/reports/screens/foundadult.dart';
import 'package:missingchild/features/reports/screens/foundchild.dart';

class Found extends StatefulWidget {
  const Found({super.key});

  @override
  State<Found> createState() => _FoundState();
}

class _FoundState extends State<Found> {
  int selectIndex = 0;

  // تحديد نوع العناصر لتجنب أخطاء النوع (Type Safety)
  final List<Widget> foundType = const [
    FoundChild(),
    Foundadult(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      // إضافة ظل خفيف وحواف أنيقة للـ NavigationBar
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
            indicatorColor: const Color(0xffDBEAFE), // أزرق فاتح مريح للتحديد
            selectedIndex: selectIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.child_care_outlined, color: Color(0xff64748B)),
                selectedIcon: Icon(Icons.child_care_rounded, color: Color(0xff2563EB)),
                label: "Child",
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded, color: Color(0xff64748B)),
                selectedIcon: Icon(Icons.person_rounded, color: Color(0xff2563EB)),
                label: "Adult",
              ),
            ],
          ),
        ),
      ),

      body: IndexedStack(
        index: selectIndex,
        children: foundType,
      ),
    );
  }
}