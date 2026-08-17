import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:ai_safetrack/core/theme/fonttext.dart';
import 'package:ai_safetrack/features/profile/models/myprofilemodel.dart';
import 'package:ai_safetrack/features/profile/widgets/imageprofiles.dart';
import 'package:ai_safetrack/features/profile/widgets/inputui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final keyeditprofile = GlobalKey<FormState>();
  final imageservice = ImageService();

  late ProfileModel profile;

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is! ProfileModel) {
      return;
    }

    profile = args;

    nameController = TextEditingController(text: profile.name);
    emailController = TextEditingController(text: profile.email);
    phoneController = TextEditingController(text: profile.phone);

    _initialized = true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SingleChildScrollView(
        child: Form(
          key: keyeditprofile,
          child: Column(
            children: [
              imageProfile(
                imageType: true,
                imageService: imageservice,
                refresh: () {
                  setState(() {});
                },
                imageurl: profile.imageUrl,
                coverpage: profile.coverpage,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 12.r,
                      offset: Offset(0, 6.h),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20.r),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      style: TextStyle(fontSize: AppFont.body(width)),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      decoration: buildInputDecoration(
                        label: "Full Name",
                        icon: Icons.person_rounded,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(fontSize: AppFont.body(width)),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: buildInputDecoration(
                        label: "Email Address",
                        icon: Icons.email_rounded,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: phoneController,
                      style: TextStyle(fontSize: AppFont.body(width)),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.trim().length < 11) {
                          return 'Enter a valid phone number (at least 11 digits)';
                        }
                        return null;
                      },
                      decoration: buildInputDecoration(
                        label: "Phone Number",
                        icon: Icons.phone_rounded,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, 'updatepass');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff1E3A8A)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        icon: Icon(
                          Icons.lock_reset_rounded,
                          color: const Color(0xff1E3A8A),
                          size: 20.r,
                        ),
                        label: Text(
                          "Update Password",
                          style: TextStyle(
                            fontSize: AppFont.button(width),
                            color: const Color(0xff1E3A8A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (keyeditprofile.currentState!.validate()) {
                      print(imageservice.updateimageprofile?.path);
                      print(imageservice.coverprofile?.path);
                      print(nameController.text);
                      print(emailController.text);
                      print(phoneController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1E3A8A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  icon: Icon(
                    Icons.save_rounded,
                    color: Colors.white,
                    size: 20.r,
                  ),
                  label: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: AppFont.button(width),
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
