import 'package:ai_safetrack/core/helpfunc/validationinput.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final updatepasswordkey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration({
    required double width,
    required String labelText,
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(fontSize: AppFont.body(width)),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: AppFont.caption(width),
      ),
      prefixIcon: Icon(prefixIcon, color: Colors.grey.shade600, size: 22.r),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: 20.r,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Form(
            key: updatepasswordkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12.h),
                Container(
                  height: 84.r,
                  width: 84.r,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.security_rounded,
                    size: 42.r,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 28.h),
                Text(
                  "Create New Password",
                  style: TextStyle(
                    fontSize: AppFont.header(width),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Your new password must be different from\npreviously used passwords.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppFont.caption(width),
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 36.h),
                TextFormField(
                  controller: passwordController,

                  obscureText: obscurePassword,
                  style: TextStyle(fontSize: AppFont.body(width)),
                  decoration: _buildInputDecoration(
                    width: width,
                    labelText: "New Password",
                    hintText: "Enter at least 8 characters",
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey.shade600,
                        size: 22.r,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: ValidationInput().passwordValidationreg,
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: obscureConfirmPassword,
                  style: TextStyle(fontSize: AppFont.body(width)),
                  decoration: _buildInputDecoration(
                    width: width,
                    labelText: "Confirm Password",
                    hintText: "Re-enter your new password",
                    prefixIcon: Icons.lock_reset_rounded,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey.shade600,
                        size: 22.r,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: ValidationInput().passwordValidationreg,
                ),
                SizedBox(height: 36.h),
                SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    onPressed: () {
                      if (updatepasswordkey.currentState!.validate()) {
                        if (passwordController.text ==
                            confirmPasswordController.text) {


                              
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "login",
                            (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Passwords do not match"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: AppFont.button(width),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
