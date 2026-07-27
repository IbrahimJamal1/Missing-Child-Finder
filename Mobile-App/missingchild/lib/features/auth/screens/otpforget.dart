import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Otpforgetpass extends StatefulWidget {
  const Otpforgetpass({super.key});

  @override
  State<Otpforgetpass> createState() => _OtpforgetpassState();
}

class _OtpforgetpassState extends State<Otpforgetpass> {
  String otp = "";
  
  // Timer state for Resend functionality
  Timer? _timer;
  int _secondsRemaining = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 30;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _timer?.cancel();
        setState(() => _canResend = true);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _verifyAndNavigate() {
    if (otp.length == 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('OTP Verified: $otp'),
          backgroundColor: Colors.green,
        ),
      );
      // TODO: Call your backend API to verify OTP, then navigate to ResetPasswordScreen



      Navigator.pushNamed(context, 'updatepass');

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the full 5-digit code'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Default pin styling
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    // Active state when box is highlighted
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: theme.primaryColor, width: 2),
      ),
    );

    // Submitted state when completed
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: theme.primaryColor.withOpacity(0.05),
        border: Border.all(color: theme.primaryColor),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),

              // Security / Password Reset Visual Icon
              Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_reset_rounded,
                  size: 42,
                  color: Colors.amber.shade800,
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "We sent a 5-digit recovery code to\nyour registered phone or email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 36),

              // Pinput Box Component
              Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onChanged: (value) {
                  otp = value;
                },
                onCompleted: (pin) {
                  otp = pin;
                  _verifyAndNavigate();
                },
              ),

              const SizedBox(height: 36),

              // Primary Action Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: _verifyAndNavigate,
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Resend Option with Dynamic Timer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  _canResend
                      ? TextButton(
                          onPressed: () {
                            _startTimer();
                            // TODO: Add resend API logic here
                          },
                          child: const Text(
                            "Resend Code",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Text(
                          "Resend in ${_secondsRemaining}s",
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
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