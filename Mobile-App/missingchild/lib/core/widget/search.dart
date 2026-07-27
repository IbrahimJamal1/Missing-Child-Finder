import 'package:ai_safetrack/getdata.dart';
import 'package:flutter/material.dart';


class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data.where((item) {
      final name = (item["childName"] ?? "").toString().toLowerCase();
      final status = (item["childStatus"] ?? "").toString().toLowerCase();

      return name.contains(query.toLowerCase()) ||
          status.contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return const Center(child: Text("No Results"));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]["childName"]),
          subtitle: Text(results[index]["childStatus"]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
    return const Center(
      child: Text("Search............"),
    );
  }
    final suggestions = data.where((item) {
      final name = (item["childName"] ?? "").toString().toLowerCase();
      final status = (item["childStatus"] ?? "").toString().toLowerCase();

      return name.contains(query.toLowerCase()) ||
          status.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(suggestions[index]["childName"]),
          subtitle: Text(suggestions[index]["childStatus"]),
          onTap: () {
            query = suggestions[index]["childName"];
            showResults(context);
          },
        );
      },
    );
  }
}
