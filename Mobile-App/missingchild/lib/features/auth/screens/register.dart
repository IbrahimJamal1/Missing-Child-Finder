import 'package:ai_safetrack/core/helpfunc/validationinput.dart';
import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/auth/widgets/customfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> registerkey = GlobalKey<FormState>();

  final TextEditingController username = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController usermail = TextEditingController();
  final TextEditingController userpassword = TextEditingController();
  DateTime currenttime = DateTime.now();

  bool _isPasswordHidden = true;

  final imageService = ImageService();

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    usermail.dispose();
    userpassword.dispose();
    imageService.idImage = null;
    imageService.liveImage = null;
    imageService.profileImage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Card(
                elevation: 16,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 32.h,
                  ),
                  child: Form(
                    key: registerkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: AppFont.header(width),
                            color: const Color(0xFF0F172A),
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Fill in your details to get started",
                          style: TextStyle(
                            fontSize: AppFont.caption(width),
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 28.h),
                        GestureDetector(
                          onTap: () async {
                            await imageService.pickImage("profile");
                            setState(() {});
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 100.r,
                                height: 100.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade50,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.15),
                                      blurRadius: 10.r,
                                      offset: Offset(0, 4.h),
                                    ),
                                  ],
                                ),
                                child: imageService.profileImage == null
                                    ? Icon(
                                        Icons.person_outline_rounded,
                                        size: 48.r,
                                        color: const Color(0xFF3B82F6),
                                      )
                                    : ClipOval(
                                        child: Image.file(
                                          imageService.profileImage!,
                                          fit: BoxFit.cover,
                                          width: 100.r,
                                          height: 100.r,
                                        ),
                                      ),
                              ),
                              Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF2563EB),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 16.r,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 28.h),
                        buildCustomField(
                          icon: Icons.person_outline_rounded,
                          label: "Full Name",
                          controller: username,
                          validator: ValidationInput().validationName,

                          width: width,
                        ),
                        buildCustomField(
                          icon: Icons.phone_outlined,
                          label: "Phone Number",
                          keyboard: TextInputType.phone,
                          controller: phone,
                          validator: ValidationInput().phoneValidation,
                          width: width,
                        ),
                        buildCustomField(
                          icon: Icons.email_outlined,
                          label: "Email Address",
                          keyboard: TextInputType.emailAddress,
                          controller: usermail,
                          validator: ValidationInput().emailValidation,
                          width: width,
                        ),
                        buildCustomField(
                          icon: Icons.lock_outline_rounded,
                          label: "Password",
                          obscure: _isPasswordHidden,
                          controller: userpassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey.shade600,
                              size: 20.r,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordHidden = !_isPasswordHidden;
                              });
                            },
                          ),
                          validator: ValidationInput().passwordValidationreg,
                          width: width,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          validator: (_) {
                            if (imageService.idImage == null) {
                              return "Please upload ID Card";
                            }

                            return null;
                          },

                          readOnly: true,

                          onTap: () async {
                            await imageService.pickImage("id");
                            setState(() {});
                          },

                          decoration: InputDecoration(
                            hintText: imageService.idImage != null
                                ? "ID UPLOADED"
                                : "UPLOAD ID",

                            hintStyle: TextStyle(
                              fontSize: AppFont.button(width),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: imageService.idImage != null
                                  ? Colors.green
                                  : const Color(0xFF1E293B),
                            ),

                            prefixIcon: Icon(
                              imageService.idImage != null
                                  ? Icons.check_circle_rounded
                                  : Icons.badge_outlined,
                              size: 20.r,
                              color: imageService.idImage != null
                                  ? Colors.green
                                  : const Color(0xFF1E293B),
                            ),

                            filled: true,

                            fillColor: imageService.idImage != null
                                ? Colors.green.shade50
                                : Colors.grey.shade50,

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: imageService.idImage != null
                                    ? Colors.green
                                    : Colors.grey.shade300,
                                width: 1.5.w,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: imageService.idImage != null
                                    ? Colors.green
                                    : const Color(0xFF1565C0),
                                width: 1.5.w,
                              ),
                            ),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.5.w,
                              ),
                            ),

                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.5.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          readOnly: true,

                          onTap: () async {
                            await imageService.uploadLiveImage();
                            setState(() {});
                          },

                          validator: (_) {
                            if (imageService.liveImage == null) {
                              return "Please upload Live Photo";
                            }

                            return null;
                          },

                          decoration: InputDecoration(
                            hintText: imageService.liveImage != null
                                ? "Live Photo UPLOADED"
                                : "UPLOAD Live Photo",

                            hintStyle: TextStyle(
                              fontSize: AppFont.button(width),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: imageService.liveImage != null
                                  ? Colors.green
                                  : const Color(0xFF1E293B),
                            ),

                            prefixIcon: Icon(
                              imageService.liveImage != null
                                  ? Icons.photo_camera_rounded
                                  : Icons.camera_alt_outlined,
                              size: 20.r,
                              color: imageService.liveImage != null
                                  ? Colors.green
                                  : const Color(0xFF1E293B),
                            ),

                            filled: true,

                            fillColor: imageService.liveImage != null
                                ? Colors.green.shade50
                                : Colors.grey.shade50,

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: imageService.liveImage != null
                                    ? Colors.green
                                    : Colors.grey.shade300,
                                width: 1.5.w,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: imageService.liveImage != null
                                    ? Colors.green
                                    : const Color(0xFF2563EB),
                                width: 1.5.w,
                              ),
                            ),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.5.w,
                              ),
                            ),

                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.5.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            if (registerkey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Confirm your phone number to complete registration",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppFont.body(width),
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );

                              Navigator.pushNamedAndRemoveUntil(context, 'otpVerification',(route)=>false);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 54.h),
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shadowColor: const Color(
                              0xFF2563EB,
                            ).withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: AppFont.button(width),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: AppFont.caption(width),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "login");
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: const Color(0xFF2563EB),
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFont.button(width),
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
            ),
          ),
        ),
      ),
    );
  }
}
