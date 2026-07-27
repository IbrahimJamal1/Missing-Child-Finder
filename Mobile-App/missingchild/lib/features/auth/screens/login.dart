import 'package:ai_safetrack/features/auth/widgets/header.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  bool hidePassword = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: loginkey,
            child: Column(
              children: [
                //================ HEADER ==================
                buildHeader(),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,

                          keyboardType: TextInputType.emailAddress,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your email";
                            }

                            if (!value.contains("@")) {
                              return "Invalid email";
                            }

                            return null;
                          },

                          decoration: InputDecoration(
                            hintText: "Email",

                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xff2563EB),
                            ),

                            filled: true,

                            fillColor: Colors.grey.shade100,

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

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

                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xff2563EB),
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
                              ),
                            ),

                            filled: true,

                            fillColor: Colors.grey.shade100,

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'reset');
                            },
                            child: const Text("Forgot Password?"),
                          ),
                        ),

                        const SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,
                          height: 55,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2563EB),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),

                            onPressed: () {
                              Navigator.pushNamed(context, "home");
                            },

                            child: const Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("OR"),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          height: 55,

                          child: OutlinedButton.icon(
                            onPressed: () {},

                            label: Image.asset(
                              "images/google-logo-icon-png-svg.png",
                              height: 30,
                            ),

                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "register");
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
