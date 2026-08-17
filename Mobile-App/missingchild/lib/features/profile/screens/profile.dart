import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/profile/models/myprofilemodel.dart';
import 'package:ai_safetrack/features/profile/widgets/deletepost.dart';
import 'package:ai_safetrack/features/profile/widgets/imageprofiles.dart';
import 'package:ai_safetrack/features/reports/models/report_model.dart';
import 'package:ai_safetrack/features/reports/screens/reportCard%20.dart';
import 'package:ai_safetrack/getdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final myname = "ibrahim gamal";
    final myemail = "ibrahim@gmail.com";
    final phone = 01011111111;
    final imageurl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMoRu8zC3OvoRY_bzhEtAhGP1ip9rds1YnPUR3geIRzg&s=10";
    final coverpage =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRloG_1vGxvVLG7IZYvvGk9IghFjt6mVUfhEbcI6MZrDw&s=10";

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                imageProfile(
                  imageurl: imageurl,
                  coverpage: coverpage,
                  imageType: false,
                  imageService: ImageService(),
                  refresh: () {},
                ),
                Text(
                  myname,
                  style: TextStyle(
                    fontSize: AppFont.title(width),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1E293B),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  myemail,
                  style: TextStyle(
                    color: const Color(0xff64748B),
                    fontSize: AppFont.body(width),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'editprofile',
                        arguments: ProfileModel(
                          name: myname,
                          email: myemail,
                          phone: phone.toString(),
                          coverpage: coverpage,
                          imageUrl: imageurl,
                        ),
                      );
                    },
                    icon: Icon(Icons.edit_rounded, size: 18.r),
                    label: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppFont.button(width),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xff3B82F6),
                      side: BorderSide(
                        color: const Color(0xff3B82F6),
                        width: 1.5.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Posts",
                      style: TextStyle(
                        fontSize: AppFont.header(width),
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff1E293B),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
          SliverLayoutBuilder(
            builder: (context, constraints) {
              return SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final child = data[index];

                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) =>
                              deletepost(onDelete: () {}),
                        );
                      },
                      child: ReportCard(
                        report: ReportModel(
                          reporterName: child["reporterName"],
                          reporterImage: child["reporterImage"],
                          reportDate: DateTime.parse(child["reportDate"]),
                          image: child["image"],
                          childName: child["childName"],
                          status: child["status"],
                          description: child["description"],
                          age: child["age"],
                          phone: child["phone"],
                          locationName: child["locationName"],
                          location: child["location"],
                          lastseen: child["lastseen"],
                          report_id: child["report_id"],
                        ),
                      ),
                    );
                  }, childCount: 3),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 14.h,
                    crossAxisSpacing: 14.w,
                    childAspectRatio: .60,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
