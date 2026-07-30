import 'package:flutter/material.dart';
import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final editprofile = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController(
    text: "Ahmed Mohamed",
  );

  final TextEditingController email = TextEditingController(
    text: "ahmed@gmail.com",
  );

  final TextEditingController phone = TextEditingController(
    text: "01012345678",
  );

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
          key: editprofile,
          child: Column(
            children: [
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
                        backgroundImage: const NetworkImage(
                          "https://i.pravatar.cc/300",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4.w,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50.r),
                      onTap: () {
                        pickImage('profileImage');
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: const BoxDecoration(
                          color: Color(0xff10B981),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
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
                      controller: name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(
                          color: const Color(0xff64748B),
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Icon(
                          Icons.person_rounded,
                          color: const Color(0xff3B82F6),
                          size: 22.r,
                        ),
                        filled: true,
                        fillColor: const Color(0xffF8FAFC),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: Color(0xffE2E8F0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: const Color(0xff3B82F6),
                            width: 1.5.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: Color(0xffEF4444),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: const Color(0xffEF4444),
                            width: 1.5.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: email,
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
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          color: const Color(0xff64748B),
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: const Color(0xff3B82F6),
                          size: 22.r,
                        ),
                        filled: true,
                        fillColor: const Color(0xffF8FAFC),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: Color(0xffE2E8F0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: const Color(0xff3B82F6),
                            width: 1.5.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: Color(0xffEF4444),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: const Color(0xffEF4444),
                            width: 1.5.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: phone,
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
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          color: const Color(0xff64748B),
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Icon(
                          Icons.phone_rounded,
                          color: const Color(0xff3B82F6),
                          size: 22.r,
                        ),
                        filled: true,
                        fillColor: const Color(0xffF8FAFC),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: Color(0xffE2E8F0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: const Color(0xff3B82F6),
                            width: 1.5.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: Color(0xffEF4444),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                            color: const Color(0xffEF4444),
                            width: 1.5.w,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, 'updatepass');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1E3A8A),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        icon: Icon(
                          Icons.update,
                          color: Colors.white,
                          size: 20.r,
                        ),
                        label: Text(
                          "Update Password",
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
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (editprofile.currentState!.validate()) {
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
