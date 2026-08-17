import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imagechaild(context, dynamic report) {
  return SliverAppBar(
    expandedHeight: 320.h,
    pinned: true,
    backgroundColor: const Color(0xFF0F172A),
    elevation: 0,
    leading: Padding(
      padding: EdgeInsets.all(8.r),
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.4),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    ),

    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,

        children: [
          Image.network(
            report.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return buildImagePlaceholder();
            },
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildImagePlaceholder() {
  return Container(
    color: const Color(0xFFCBD5E1),

    child: Center(
      child: Icon(
        Icons.person_rounded,
        size: 80.r,
        color: const Color(0xFF64748B),
      ),
    ),
  );
}
