import 'package:flutter/material.dart';
import 'package:missingchild/core/widget/search.dart';
import 'package:missingchild/features/reports/screens/found.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "AI-MIDS",
          style: TextStyle(
            color: Color(0xff1565C0),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1565C0)),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),

          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'notification');
            },
            icon: const Icon(Icons.notifications_none),
          ),

          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'publish');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      drawer: Drawer(
        child: Container(
          color: const Color(0xffF8FAFC), 
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1E3A8A),
                      Color(0xff0D47A1),
                    ], 
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
                    _drawerItem(
                      icon: Icons.public,
                      title: "Publish",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'publish');
                      },
                    ),

                    _drawerItem(
                      icon: Icons.person_outline_rounded,
                      title: "Profile",
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                        Navigator.pushNamed(context, "profile");
                      },
                    ),
                    const Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                      color: Color(0xffE2E8F0),
                    ),

                    _drawerItem(
                      icon: Icons
                          .notifications_none_rounded, 
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

                    _drawerItem(
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

                    _drawerItem(
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

                    _drawerItem(
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

                    _drawerItem(
                      icon: Icons.star_outline_rounded,
                      title: "Rate App",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "rate");
                      },
                    ),

                    _drawerItem(
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
                      backgroundColor: const Color(
                        0xffFEF2F2,
                      ), 
                      foregroundColor: const Color(
                        0xffEF4444,
                      ), 
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.logout_rounded, size: 20),
                    label: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body:Found(),
  
    );
  }
}

Widget _drawerItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: CircleAvatar(
      radius: 18,
      backgroundColor: Colors.blue.shade50,
      child: Icon(icon, color: const Color(0xff1565C0)),
    ),
    title: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    onTap: onTap,
  );
}
