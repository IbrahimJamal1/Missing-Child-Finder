import 'package:flutter/material.dart';

class Commentpage extends StatefulWidget {
  const Commentpage({super.key});

  @override
  State<Commentpage> createState() => _CommentpageState();
}

class _CommentpageState extends State<Commentpage> {
  final TextEditingController commentController = TextEditingController();

  final List<String> comment= [
    "Great application 👏",
    "Hope this child is found soon.",
    "Thank you for your efforts ❤️",
  ];

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: Column(
        children: [
          /// Old Comments
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: comment.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text("Name Person"),
                    subtitle: Text(comment[index]),
                    trailing: const Text("12:00 PM"),
                  ),
                );
              },
            ),
          ),

          /// Input + Send Button
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    onPressed: (){

                    },
                    icon: const Icon(Icons.send),
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