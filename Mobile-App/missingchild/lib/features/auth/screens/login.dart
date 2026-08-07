import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/auth/widgets/loginheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  bool hidePassword = true;
  final TextEditingController emailorphone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    emailorphone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: loginkey,
            child: Column(
              children: [
                buildHeader(width),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 20.r,
                          offset: Offset(0, 10.h),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailorphone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your email or phone number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Email Or Phone Number",
                            hintStyle: TextStyle(fontSize: AppFont.body(width)),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: const Color(0xff2563EB),
                              size: 22.r,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: password,
                          obscureText: hidePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter password";
                            }
                            if (value.length < 6) {
                              return "Minimum 6 characters";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: AppFont.body(width)),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: const Color(0xff2563EB),
                              size: 22.r,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 22.r,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'reset');
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: AppFont.body(width),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: double.infinity,
                          height: 55.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2563EB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            onPressed: () {
                              if (loginkey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "home",
                                  (route) => false,
                                );
                              }
                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFont.button(width),
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                "OR",
                                style: TextStyle(fontSize: AppFont.body(width)),
                              ),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          height: 55.h,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            label: Image.asset(
                              "images/google-logo-icon-png-svg.png",
                              height: 30.h,
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: AppFont.body(width)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFont.button(width),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}