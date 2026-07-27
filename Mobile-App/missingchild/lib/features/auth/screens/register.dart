import 'package:ai_safetrack/core/services/uploadimage.dart';
import 'package:ai_safetrack/features/auth/widgets/customfiled.dart';
import 'package:flutter/material.dart';

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
  DateTime currenttime =DateTime.now();

  bool _isPasswordHidden = true;
  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    usermail.dispose();
    userpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Card(
                elevation: 16,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Form(
                    key: registerkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title Section
                        const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFF0F172A),
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Fill in your details to get started",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 28),

                        GestureDetector(
                          onTap: () async {
                            await pickImage("profile");
                            setState(() {});
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade50,
                                  border: Border.all(
                                    color: const Color(0xFF3B82F6),
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.15),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: profileImage == null
                                    ? const Icon(
                                        Icons.person_outline_rounded,
                                        size: 48,
                                        color: Color(0xFF3B82F6),
                                      )
                                    : ClipOval(
                                        child: Image.file(
                                          profileImage!,
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF2563EB),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt_rounded,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 28),

                        // Input Fields
                        buildCustomField(
                          icon: Icons.person_outline_rounded,
                          label: "Full Name",
                          controller: username,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),

                        buildCustomField(
                          icon: Icons.phone_outlined,
                          label: "Phone Number",
                          keyboard: TextInputType.phone,
                          controller: phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Phone is required";
                            }
                            if (value.trim().length != 11) {
                              return "Phone must be 11 digits";
                            }
                            return null;
                          },
                        ),

                        buildCustomField(
                          icon: Icons.email_outlined,
                          label: "Email Address",
                          keyboard: TextInputType.emailAddress,
                          controller: usermail,
                          validator: (value) {
                            if (value == null ||
                                !RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
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
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordHidden = !_isPasswordHidden;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 8),

                        // ID Upload Button
                        OutlinedButton.icon(
                          onPressed: () async {
                            await pickImage("id");
                            setState(() {});
                          },
                          icon: Icon(
                            idImage != null
                                ? Icons.check_circle_rounded
                                : Icons.badge_outlined,
                            color: idImage != null
                                ? Colors.green
                                : const Color(0xFF1E293B),
                          ),
                          label: Text(
                            idImage != null ? "ID UPLOADED" : "UPLOAD ID",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: idImage != null
                                  ? Colors.green
                                  : const Color(0xFF1E293B),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 52),
                            side: BorderSide(
                              color: idImage != null
                                  ? Colors.green
                                  : Colors.grey.shade300,
                              width: 1.5,
                            ),
                            backgroundColor: idImage != null
                                ? Colors.green.shade50
                                : Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Submit Button
                        ElevatedButton(
                          onPressed: () {
                            if (registerkey.currentState!.validate()) {
                              


                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 54),
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shadowColor: const Color(
                              0xFF2563EB,
                            ).withValues(alpha: 0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "login");
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
