import 'package:ai_safetrack/features/detailspost/screen/detailsposthome.dart';
import 'package:ai_safetrack/features/reports/models/report_model.dart';
import 'package:ai_safetrack/getdata.dart';
import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search Name Or Status....';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xffF5F5F5),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(
        margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear, size: 20),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded, size: 22),
      ),
    );
  }

  // ================= SEARCH FUNCTION =================

  List<ReportModel> getFilteredData() {
    final search = query.trim().toLowerCase();

    if (search.isEmpty) {
      return [];
    }

    return data
        .where((item) {
          final name = (item["childName"] ?? "").toString().toLowerCase();

          final status = (item["status"] ?? "").toString().toLowerCase();

          return name.contains(search) || status.contains(search);
        })
        .map((item) => ReportModel.fromJson(item))
        .toList();
  }

  // ================= RESULTS =================

  @override
  Widget buildResults(BuildContext context) {
    final results = getFilteredData();

    if (results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("🔍", style: TextStyle(fontSize: 60)),
            SizedBox(height: 30),
            Text(
              "No results found",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            Text(
              "Try different name or status",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final child = results[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),

                  leading: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xffEAF2FF),
                    child: Icon(Icons.person, color: Colors.blue, size: 30),
                  ),

                  title: Text(
                    child.childName.isNotEmpty ? child.childName : "Unknown",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      child.status.isNotEmpty ? child.status : "Unknown",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ================= SUGGESTIONS =================

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: 40),

          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Search Icon
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        size: 55,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Title
                    const Text(
                      "Search Reports",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Description
                    const Text(
                      "Search for missing, found persons\nor accident reports",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Search Hint
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 18,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Type a name or status to search",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    final suggestions = getFilteredData();

    if (suggestions.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("🔍", style: TextStyle(fontSize: 60)),
            SizedBox(height: 30),
            Text(
              "No results found",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            Text(
              "Try different keywords",
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            '${suggestions.length} results',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final child = suggestions[index];

              return ListTile(
                leading: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF2FF),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.15),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: child.image.isNotEmpty
                        ? Image.network(
                            child.image,
                            width: 58,
                            height: 58,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person_rounded,
                                color: Colors.blue,
                                size: 32,
                              );
                            },
                          )
                        : const Icon(
                            Icons.person_rounded,
                            color: Colors.blue,
                            size: 32,
                          ),
                  ),
                ),

                title: Text(
                  child.childName.toString().trim(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                subtitle: Text(child.status.toString().trim()),

                trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detailspost(report: child),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
