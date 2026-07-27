
import 'package:flutter/material.dart';

Widget buildDrawerItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: Icon(icon, color: const Color(0xFF475569), size: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1E293B),
        ),
      ),
      onTap: onTap,
    ),
  );
}

class CustomDivider extends StatelessWidget {
  final Color color;
  const CustomDivider({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 16,
      thickness: 1,
      indent: 8,
      endIndent: 8,
      color: color,
    );
  }
}