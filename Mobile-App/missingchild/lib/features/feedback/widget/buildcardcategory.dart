import 'package:flutter/material.dart';

Widget buildCategoryCard({
  required String category,
  required IconData icon,
  required String selectedCategory,
  required ValueChanged<String> onSelect,
}) {
  final bool isSelected = selectedCategory == category;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeInOut,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSelect(category),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffEFF6FF) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? const Color(0xff2563EB) : const Color(0xffE2E8F0),
              width: isSelected ? 1.5 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xff2563EB).withAlpha(20),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? const Color(0xff2563EB) : const Color(0xff64748B),
                size: 20,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  category,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    color: isSelected ? const Color(0xff2563EB) : const Color(0xff64748B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}