import 'package:flutter/material.dart';
import 'package:ai_safetrack/features/feedback/widget/buildactioncard.dart';
import 'package:ai_safetrack/features/feedback/widget/buildcardcategory.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _feedbackKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();
  String _selectedCategory = "Suggestion";

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "Send Feedback",
          style: TextStyle(
            color: Color(0xff0F172A),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff0F172A)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: _feedbackKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const Text(
                "We value your opinion",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0F172A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Tell us how we can improve your experience or report any issues you faced.",
                style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              // Category Selector
              const Text(
                "Select Category",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff334155),
                ),
              ),
              const SizedBox(height: 12),
              
              // 2x2 Grid to ensure responsive fit across all screen sizes
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2,
                children: [

                  buildCategoryCard(
                    category: "Suggesttion",
                    icon: Icons.lightbulb_outline_rounded,
                    selectedCategory: _selectedCategory,
                    onSelect: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),

                  buildCategoryCard(
                    category: "Bug Report",
                    icon: Icons.bug_report_outlined,
                    selectedCategory: _selectedCategory,
                    onSelect: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),

                   buildActionCard(
                    "Rate Us",
                    Icons.star_outline_rounded,
                    onTap: () => Navigator.pushNamed(context, 'rate'),
                  ),
                  buildCategoryCard(
                    category: "Other",
                    icon: Icons.lightbulb_outline_rounded,
                    selectedCategory: _selectedCategory,
                    onSelect: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Message Input Header
              const Text(
                "Your Message",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff334155),
                ),
              ),
              const SizedBox(height: 12),
              
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                maxLength: 500,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 14, color: Color(0xff0F172A)),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please write your message before sending';
                  }
                  if (value.trim().length < 10) {
                    return 'Please write a more descriptive message';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Write your feedback here...",
                  hintStyle: const TextStyle(
                    color: Color(0xff94A3B8),
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  alignLabelWithHint: true,
                  counterStyle: const TextStyle(color: Color(0xff94A3B8), fontSize: 12),
                  contentPadding: const EdgeInsets.all(16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xffE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xff2563EB),
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xffEF4444)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xffEF4444),
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_feedbackKey.currentState!.validate()) {

                      //backend logic


                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Row(
                            children: [
                              Icon(Icons.check_circle_outline, color: Colors.white),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Feedback Sent Successfully! Thank you.",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: const Color(0xff10B981),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                      _feedbackController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1E3A8A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                  label: const Text(
                    "Submit Feedback",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}