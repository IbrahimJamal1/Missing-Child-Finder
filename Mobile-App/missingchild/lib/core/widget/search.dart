import 'package:ai_safetrack/getdata.dart';
import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  // ================= RESULTS =================

  @override
  Widget buildResults(BuildContext context) {
    final results = data.where((item) {
      final name =
          (item["childName"] ?? "").toString().toLowerCase();

      final status =
          (item["childStatus"] ?? "").toString().toLowerCase();

      final search = query.toLowerCase();

      return name.contains(search) || status.contains(search);
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 70,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              "No Results Found",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Try searching with another name or status",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final child = results[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),

            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: const Icon(
                Icons.person,
                color: Colors.blue,
                size: 30,
              ),
            ),

            title: Text(
              child["childName"] ?? "Unknown",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                child["childStatus"] ?? "Unknown",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        );
      },
    );
  }

  // ================= SUGGESTIONS =================

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.search,
                  size: 50,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Search",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Search for missing , found persons OR accident",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final suggestions = data.where((item) {
      final name =
          (item["childName"] ?? "").toString().toLowerCase();

      final status =
          (item["childStatus"] ?? "").toString().toLowerCase();

      final search = query.toLowerCase();

      return name.contains(search) || status.contains(search);
    }).toList();

    if (suggestions.isEmpty) {
      return const Center(
        child: Text(
          "No Ruselt",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final child = suggestions[index];

        return ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),

          title: Text(
            child["childName"] ?? "Unknown",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Text(
            child["childStatus"] ?? "Unknown",
          ),

          onTap: () {
            query = child["childName"];
            showResults(context);
          },
        );
      },
    );
  }
}