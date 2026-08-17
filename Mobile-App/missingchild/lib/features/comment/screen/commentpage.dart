import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Commentpage extends StatefulWidget {
  const Commentpage({super.key});

  @override
  State<Commentpage> createState() => _CommentpageState();
}

class _CommentpageState extends State<Commentpage> {
  final TextEditingController commentController = TextEditingController();

  final List<String> comment = [
    "Great application ",
    "Hope this child is found soon.",
    "Thank you for your efforts ",
  ];

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final reportId = ModalRoute.of(context)!.settings.arguments as String;
    // ignore: unused_local_variable
    DateTime currentdatecomment=DateTime.now() ;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comments",
          style: TextStyle(fontSize: AppFont.header(width)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.r),
              itemCount: comment.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20.r,
                      child: Icon(Icons.person, size: 20.r),
                    ),
                    title: Text(
                      "Name Person",
                      style: TextStyle(
                        fontSize: AppFont.subtitle(width),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      comment[index],
                      style: TextStyle(fontSize: AppFont.body(width)),
                    ),
                    trailing: Text(
                      "12:00 PM",
                      style: TextStyle(fontSize: AppFont.caption(width)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.r),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    style: TextStyle(fontSize: AppFont.body(width)),
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      hintStyle: TextStyle(fontSize: AppFont.body(width)),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  radius: 25.r,
                  child: IconButton(
                    onPressed: () {
                      
                      // print("==========================$reportId");
                      // print("==========================$currentdatecomment");
                      // print("==============================${commentController.text}");


                    },
                    icon: Icon(Icons.send, size: 20.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
