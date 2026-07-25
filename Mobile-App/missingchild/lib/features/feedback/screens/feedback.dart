import 'package:flutter/material.dart';

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
        centerTitle: true,
        title: const Text(
          "Send Feedback",
          style: TextStyle(
            color: Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _feedbackKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. عنوان فرعي ترحيبي
              const Text(
                "We value your opinion",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E293B),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Tell us how we can improve your experience or report any issues you faced.",
                style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Select Category",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E293B),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildCategoryCard(
                    "Suggestion",
                    Icons.lightbulb_outline_rounded,
                  ),
                  const SizedBox(width: 10),
                  _buildCategoryCard("Bug Report", Icons.bug_report_outlined),
                  const SizedBox(width: 10),
                  _buildCategoryCard("Other", Icons.more_horiz_rounded),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                "Your Message",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E293B),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _feedbackController,
                maxLines: 4, // إعطاء مساحة عمودية مريحة للكتابة
                maxLength: 500, // حد أقصى للحروف لحماية الـ Database
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
                  counterStyle: const TextStyle(color: Color(0xff94A3B8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xffE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xff3B82F6),
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

              const SizedBox(height: 32),

              // 4. زر الإرسال (Submit Button)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_feedbackKey.currentState!.validate()) {
                      // منطق الإرسال للسيرفر يوضع هنا لاحقاً
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Feedback Sent Successfully! Thank you.",
                          ),
                          backgroundColor: Color(0xff10B981),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      _feedbackController.clear(); // مسح النص بعد الإرسال
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

  // ويدجت مساعدة لبناء كروت التصنيف التفاعلية
  Widget _buildCategoryCard(String category, IconData icon) {
    final bool isSelected = _selectedCategory == category;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedCategory = category;
          });
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffEFF6FF) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected
                  ? const Color(0xff3B82F6)
                  : const Color(0xffE2E8F0),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? const Color(0xff3B82F6)
                    : const Color(0xff64748B),
                size: 24,
              ),
              const SizedBox(height: 6),
              Text(
                category,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? const Color(0xff3B82F6)
                      : const Color(0xff64748B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
