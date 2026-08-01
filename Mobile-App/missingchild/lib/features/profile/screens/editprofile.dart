import 'package:ai_safetrack/features/profile/widgets/inputui.dart';
import 'package:flutter/material.dart';
import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final keyeditprofile = GlobalKey<FormState>();
  final _imageService = ImageService();

  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: const Color(0xff1E3A8A),
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff1E3A8A)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Form(
          key: keyeditprofile,
          child: Column(
            children: [
              // Profile Image Avatar Stack
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 16.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 64.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundColor: const Color(0xffF1F5F9),
                        backgroundImage: _imageService.profileImage != null
                            ? FileImage(_imageService.profileImage!)
                                as ImageProvider
                            : const NetworkImage("https://i.pravatar.cc/400"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4.w,
                    child: GestureDetector(
                      onTap: () async {
                        
                            await _imageService.pickImage("profile");
                        setState(() {}); // Refresh the UI after picking an image
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2563EB),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.2),
                              blurRadius: 8.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 18.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),

              // Inputs Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 12.r,
                      offset: Offset(0, 6.h),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20.r),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
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
                      controller: _emailController,
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
                      controller: _phoneController,
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
                            fontSize: 16.sp,
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

              // Save Action Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (keyeditprofile.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profile Updated Successfully"),
                          backgroundColor: Color(0xff10B981),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "profile",
                        (route) => false,
                      );
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
                      fontSize: 16.sp,
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