import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget personInfo(TextEditingController personname, TextEditingController personage, TextEditingController personphone) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Card(
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Color.fromARGB(255, 208, 231, 248),
                  child: Icon(Icons.person, color: Color(0xff1565C0)),
                ),
                SizedBox(width: 12.w),
                Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// Name
            TextFormField(
              controller: personname,
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "Enter person's name",
                prefixIcon: const Icon(Icons.person_outline),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// Age
            TextFormField(
              controller: personage,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "Enter age",
                prefixIcon: const Icon(Icons.cake_outlined),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// Phone
            TextFormField(
              controller: personphone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone",
                hintText: "01XXXXXXXXX",
                prefixIcon: const Icon(Icons.phone_outlined),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
