import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/home/widget/builddraweritem.dart';
import 'package:ai_safetrack/features/profile/widgets/deleteaccountdilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHomeDrawer(BuildContext context) {
  const primaryColor = Color(0xFF1E3A8A);
  const backgroundColor = Color(0xFFF8FAFC);
  const dividerColor = Color(0xFFE2E8F0);
  const logoutBgColor = Color(0xFFFEF2F2);
  const logoutTextColor = Color(0xFFEF4444);
  final width = MediaQuery.of(context).size.width;

  return Drawer(
    width: MediaQuery.of(context).size.width * .66,
    child: Material(
      color: backgroundColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryColor, Color(0xFF0D47A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            currentAccountPicture: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(3.r),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFEFF6FF),
                child: Icon(
                  Icons.person_rounded,
                  size: 42.r,
                  color: primaryColor,
                ),
              ),
            ),
            accountName: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Ibrahim Gamal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFont.subtitle(width),
                  color: Colors.white,
                ),
              ),
            ),
            accountEmail: Text(
              "ibrahimgamal932@gmail.com",
              style: TextStyle(
                color: const Color(0xFFCBD5E1),
                fontSize: AppFont.caption(width),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              children: [
                buildDrawerItem(
                  width: width,
                  icon: Icons.update,
                  title: "Update Password",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'updatepass');
                  },
                ),
                buildDrawerItem(
                  width: width,
                  icon: Icons.person_outline_rounded,
                  title: "Profile",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'profile');
                  },
                ),
                const CustomDivider(color: dividerColor),
                buildDrawerItem(
                  width: width,
                  icon: Icons.notifications_none_rounded,
                  title: "Notifications",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'notification');
                  },
                ),
                const CustomDivider(color: dividerColor),
                buildDrawerItem(
                  width: width,
                  icon: Icons.person_search_rounded,
                  title: "Missing",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'missing');
                  },
                ),
                buildDrawerItem(
                  width: width,
                  icon: Icons.check_circle_outline_rounded,
                  title: "Found",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'home');
                  },
                ),
                const CustomDivider(color: dividerColor),
                buildDrawerItem(
                  width: width,
                  icon: Icons.info_outline_rounded,
                  title: "About Us",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'about');
                  },
                ),
                buildDrawerItem(
                  width: width,
                  icon: Icons.star_outline_rounded,
                  title: "Rate App",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'rate');
                  },
                ),
                buildDrawerItem(
                  width: width,
                  icon: Icons.feedback_outlined,
                  title: "Feedback",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'feedback');
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(5.r),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: logoutBgColor,
                  foregroundColor: logoutTextColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) => deleteAccountDialog(onDelete: () {}),
                  );
                },

                icon: Icon(Icons.delete, size: 20.r),
                label: Text(
                  "Delet Account",
                  style: TextStyle(
                    fontSize: AppFont.button(width),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: logoutBgColor,
                  foregroundColor: logoutTextColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.logout_rounded, size: 20.r),
                label: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: AppFont.button(width),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
