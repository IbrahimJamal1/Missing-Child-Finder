import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({super.key});

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Default themes for Pinput states
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: theme.primaryColor, width: 2),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade400),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Visual Icon / Illustration placeholder
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.mark_email_read_rounded,
                  size: 40,
                  color: theme.primaryColor,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                "Enter Verification Code",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Please enter the 5-digit code sent to your phone.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 36),

              // Modern Pinput Widget
              Pinput(
                length: 5, // Updated to match the text (5-digit)
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onChanged: (value) {
                  otp = value;
                },
                onCompleted: (pin) {
                  otp = pin;
                  // Auto-submit when complete (optional):
                  // _verifyOtp();
                },
              ),

              const SizedBox(height: 36),

              // Primary Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    if (otp.length == 5) {
                      print("Verifying OTP: $otp");
                      // verifyOtp(email, otp);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter full 5-digit code")),
                      );
                    }
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Resend Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      // resend otp logic
                    },
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}