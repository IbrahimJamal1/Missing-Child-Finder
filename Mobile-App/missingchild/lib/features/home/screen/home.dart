import 'package:flutter/material.dart';
import 'package:ai_safetrack/core/widget/search.dart';
import 'package:ai_safetrack/features/home/widget/drawerhomepage.dart';
import 'package:ai_safetrack/features/reports/screens/found.dart';

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

      drawer: bulidDrawerhome(context),
   
      body:Found(),
  
    );
  }
}

Widget drawerItem({
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
