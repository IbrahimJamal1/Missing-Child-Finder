import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget personInfo(
  BuildContext context,
  TextEditingController personname,
  TextEditingController personage,
  TextEditingController personphone,
) {
  double width = MediaQuery.of(context).size.width;

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
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Color.fromARGB(255, 208, 231, 248),
                  child: Icon(Icons.person, color: Color(0xff1565C0)),
                ),
                SizedBox(width: 12.w),
                Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: AppFont.header(width),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            TextFormField(
              controller: personname,
              style: TextStyle(fontSize: AppFont.body(width)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Full Name",
                labelStyle: TextStyle(fontSize: AppFont.body(width)),
                hintText: "Enter person's name",
                hintStyle: TextStyle(fontSize: AppFont.body(width)),
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

            TextFormField(
              controller: personage,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: AppFont.body(width)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the age';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Age",
                labelStyle: TextStyle(fontSize: AppFont.body(width)),
                hintText: "Enter age",
                hintStyle: TextStyle(fontSize: AppFont.body(width)),
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

            TextFormField(
              controller: personphone,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: AppFont.body(width)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the phone number';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Phone",
                labelStyle: TextStyle(fontSize: AppFont.body(width)),
                hintText: "01XXXXXXXXX",
                hintStyle: TextStyle(fontSize: AppFont.body(width)),
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