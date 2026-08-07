import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/home/widget/drawerhomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ai_safetrack/core/widget/search.dart';
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
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "AI-MIDS",
          style: TextStyle(
            color: const Color(0xff1565C0),
            fontWeight: FontWeight.bold,
            fontSize: AppFont.header(width),
          ),
        ),
        iconTheme: IconThemeData(
          color: const Color(0xff1565C0),
          size: 24.r,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: Icon(Icons.search, size: 24.r),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'notification');
            },
            icon: Icon(Icons.notifications_none, size: 24.r),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'publish');
            },
            icon: Icon(Icons.add_circle_outline_rounded, size: 24.r),
          ),
        ],
      ),
      drawer: buildHomeDrawer(context),
      body: const Found(),
    );
  }
}