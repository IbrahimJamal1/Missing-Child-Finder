import 'package:flutter/material.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key});

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  int _selectedStars = 0;

  String _getRatingFeedback() {
    switch (_selectedStars) {
      case 1:
        return "We are sorry to hear that. Tell us how we can improve.";
      case 2:
        return "Thank you. We will work harder to make it better.";
      case 3:
        return "Glad you like it! We appreciate your support.";
      case 4:
        return "Awesome! We are thrilled to provide a good experience.";
      case 5:
        return "Wow! Thank you so much for the full support!";
      default:
        return "Tap a star to give your feedback. Your support helps us make the community safer.";
    }
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
          "Rate App",
          style: TextStyle(
            color: Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xffFEF3C7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.star_rounded,
                    color: Color(0xffD97706),
                    size: 50,
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Enjoying AI-MIDS?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E293B),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  _getRatingFeedback(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff64748B),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final int starValue = index + 1;
                    final bool isSelected = starValue <= _selectedStars;

                    return IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedStars = starValue;
                        });
                      },
                      iconSize: 42,
                      icon: Icon(
                        isSelected
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: isSelected
                            ? const Color(0xffF59E0B)
                            : const Color(0xffCBD5E1),
                      ),
                      splashRadius: 24,
                    );
                  }),
                ),

                const SizedBox(height: 36),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _selectedStars == 0
                              ? null
                              : () {

                                  //back end logic

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Thank you for your rating!",
                                      ),
                                      backgroundColor: Color(0xff10B981),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1E3A8A),
                            disabledBackgroundColor: const Color(0xffE2E8F0),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _selectedStars == 0
                                  ? const Color(0xff94A3B8)
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xffE2E8F0),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Maybe Later",
                            style: TextStyle(
                              color: Color(0xff64748B),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
