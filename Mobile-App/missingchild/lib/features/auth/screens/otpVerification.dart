import 'dart:async';

import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({super.key});

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  String otp = "";

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 60.h,
      textStyle: TextStyle(
        fontSize: AppFont.subtitle(width),
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: theme.primaryColor, width: 2.w),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.15),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
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
        title: Text(
          "OTP Verification",
          style: TextStyle(fontSize: AppFont.subtitle(width)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Container(
                width: 80.r,
                height: 80.r,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.mark_email_read_rounded,
                  size: 40.r,
                  color: theme.primaryColor,
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                "Enter Verification Code",
                style: TextStyle(
                  fontSize: AppFont.header(width),
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Please enter the 5-digit code sent to your phone.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFont.caption(width),
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 36.h),
              Pinput(
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onChanged: (value) {
                  otp = value;
                },
                onCompleted: (pin) {
                  otp = pin;
                },
              ),
              SizedBox(height: 36.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    if (otp.length == 5) {
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Please enter full 5-digit code",
                            style: TextStyle(fontSize: AppFont.body(width)),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: AppFont.button(width),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: AppFont.caption(width),
                    ),
                  ),
                  _canResend
                      ? TextButton(
                          onPressed: () {
                            _startTimer();
                          },
                          child: Text(
                            "Resend Code",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppFont.caption(width),
                            ),
                          ),
                        )
                      : Text(
                          "Resend in ${_secondsRemaining}s",
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: AppFont.caption(width),
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