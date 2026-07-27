import 'package:flutter/material.dart';
import 'package:ai_safetrack/features/home/screen/home.dart';

Widget bulidDrawerhome(context) {
  return Drawer(
    child: Container(
      color: const Color(0xffF8FAFC),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff1E3A8A), Color(0xff0D47A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            currentAccountPicture: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: Color(0xffEFF6FF),
                child: Icon(
                  Icons.person_rounded,
                  size: 40,
                  color: Color(0xff1E3A8A),
                ),
              ),
            ),
            accountName: const Text(
              "Ibrahim Gamal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            accountEmail: const Text(
              "ibrahimgamal932@gmail.com",
              style: TextStyle(color: Color(0xffE2E8F0), fontSize: 14),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                drawerItem(
                  icon: Icons.public,
                  title: "Publish",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'publish');
                  },
                ),

                drawerItem(
                  icon: Icons.person_outline_rounded,
                  title: "Profile",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "profile");
                  },
                ),
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xffE2E8F0),
                ),

                drawerItem(
                  icon: Icons.notifications_none_rounded,
                  title: "Notifications",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "notification");
                  },
                ),
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xffE2E8F0),
                ),

                drawerItem(
                  icon: Icons.person_search_rounded,
                  title: "Missing ",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'missing');
                  },
                ),
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xffE2E8F0),
                ),

                drawerItem(
                  icon: Icons.check_circle_outline_rounded,
                  title: "Found ",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'home');
                  },
                ),
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xffE2E8F0),
                ),

                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xffE2E8F0),
                ),

                drawerItem(
                  icon: Icons.info_outline_rounded,
                  title: "About Us",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'about');
                  },
                ),
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xffE2E8F0),
                ),

                drawerItem(
                  icon: Icons.star_outline_rounded,
                  title: "Rate App",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "rate");
                  },
                ),

                drawerItem(
                  icon: Icons.feedback,
                  title: "FeedBack",
                  onTap: () {
                    Navigator.pushNamed(context, "feedback");
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFEF2F2),
                  foregroundColor: const Color(0xffEF4444),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded, size: 20),
                label: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
