import 'package:ai_safetrack/features/home/widget/builddraweritem.dart';
import 'package:flutter/material.dart';

Widget buildHomeDrawer(BuildContext context) {
  const primaryColor = Color(0xFF1E3A8A);
  const backgroundColor = Color(0xFFF8FAFC);
  const dividerColor = Color(0xFFE2E8F0);
  const logoutBgColor = Color(0xFFFEF2F2);
  const logoutTextColor = Color(0xFFEF4444);

  return Drawer(
    child: Material(
      color: backgroundColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, Color(0xFF0D47A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            currentAccountPicture: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: Color(0xFFEFF6FF),
                child: Icon(
                  Icons.person_rounded,
                  size: 42,
                  color: primaryColor,
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
              style: TextStyle(
                color: Color(0xFFCBD5E1),
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                buildDrawerItem(
                  icon: Icons.public_rounded,
                  title: "Publish",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'publish');
                  },
                ),
                buildDrawerItem(
                  icon: Icons.person_outline_rounded,
                  title: "Profile",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'profile');
                  },
                ),
                const CustomDivider(color: dividerColor),
                buildDrawerItem(
                  icon: Icons.notifications_none_rounded,
                  title: "Notifications",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'notification');
                  },
                ),
                const CustomDivider(color: dividerColor),
                buildDrawerItem(
                  icon: Icons.person_search_rounded,
                  title: "Missing",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'missing');
                  },
                ),
                buildDrawerItem(
                  icon: Icons.check_circle_outline_rounded,
                  title: "Found",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'home');
                  },
                ),
                const CustomDivider(color: dividerColor),
                buildDrawerItem(
                  icon: Icons.info_outline_rounded,
                  title: "About Us",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'about');
                  },
                ),
                buildDrawerItem(
                  icon: Icons.star_outline_rounded,
                  title: "Rate App",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'rate');
                  },
                ),
                buildDrawerItem(
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
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: logoutBgColor,
                  foregroundColor: logoutTextColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded, size: 20),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 15,
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
