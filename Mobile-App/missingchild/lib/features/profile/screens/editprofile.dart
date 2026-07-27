
import 'package:flutter/material.dart';
import 'package:ai_safetrack/core/services/uploadimage.dart';

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
      backgroundColor: const Color(0xffF8FAFC), // الخلفية الموحدة الهادئة للتطبيق
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Color(0xff1E3A8A), // الأزرق الاحترافي الخاص بالتطبيق
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff1E3A8A),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: editprofile,
          child: Column(
            children: [
              // قسم الصورة الشخصية وزر الكاميرا التفاعلي
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xffF1F5F9),
                        backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        pickImage('profileImage');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff10B981), // اللون الأخضر المريح المعتمد للأزرار التفاعلية
                          shape: BoxShape.circle,
                          border: Border.symmetric(
                            
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // حاوية حقول الإدخال (Form Fields Container)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // حقل إدخال الاسم
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
                        labelStyle: const TextStyle(color: Color(0xff64748B), fontSize: 14),
                        prefixIcon: const Icon(Icons.person_rounded, color: Color(0xff3B82F6)),
                        filled: true,
                        fillColor: const Color(0xffF8FAFC),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffE2E8F0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xff3B82F6), width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffEF4444)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffEF4444), width: 1.5),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // حقل إدخال البريد الإلكتروني
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
                        labelStyle: const TextStyle(color: Color(0xff64748B), fontSize: 14),
                        prefixIcon: const Icon(Icons.email_rounded, color: Color(0xff3B82F6)),
                        filled: true,
                        fillColor: const Color(0xffF8FAFC),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffE2E8F0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xff3B82F6), width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffEF4444)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffEF4444), width: 1.5),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // حقل إدخال رقم الهاتف
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
                        labelStyle: const TextStyle(color: Color(0xff64748B), fontSize: 14),
                        prefixIcon: const Icon(Icons.phone_rounded, color: Color(0xff3B82F6)),
                        filled: true,
                        fillColor: const Color(0xffF8FAFC),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffE2E8F0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xff3B82F6), width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffEF4444)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xffEF4444), width: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // زر حفظ التغييرات الاحترافي (Save Changes Button)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (editprofile.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profile Updated Successfully"),
                          backgroundColor: Color(0xff10B981), // لون أخضر عند نجاح الحفظ
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
                    backgroundColor: const Color(0xff1E3A8A), // أزرق داكن متناسق مع التطبيق
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.save_rounded, color: Colors.white, size: 20),
                  label: const Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 16,
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