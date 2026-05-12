import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../database/database_helper.dart';
import '../home/home_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/screen_bg.png"), fit: BoxFit.cover)

        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 20),

                  Text(
                    "Create Account",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Register to continue",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 🔥 CARD
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        )
                      ],
                    ),
                    child: Column(
                      children: [

                        _modernField(
                          nameController,
                          "Full Name",
                          Icons.person,
                          isObscured: false,
                          toggleVisibility: () {},
                        ),

                        const SizedBox(height: 15),

                        _modernField(
                          contactController,
                          "Contact Number",
                          Icons.phone,
                          isNumber: true,
                          isObscured: false,
                          toggleVisibility: () {},
                        ),

                        const SizedBox(height: 15),

                        _modernField(
                          emailController,
                          "Email",
                          Icons.email,
                          isObscured: false,
                          toggleVisibility: () {},
                        ),

                        const SizedBox(height: 15),

                        /// 🔐 PASSWORD FIELD
                        _modernField(
                          passwordController,
                          "Password",
                          Icons.lock,
                          isPassword: true,
                          isObscured: isPasswordObscured,
                          toggleVisibility: () {
                            setState(() {
                              isPasswordObscured = !isPasswordObscured;
                            });
                          },
                        ),

                        const SizedBox(height: 15),

                        /// 🔐 CONFIRM PASSWORD FIELD
                        _modernField(
                          confirmPasswordController,
                          "Confirm Password",
                          Icons.lock,
                          isPassword: true,
                          isObscured: isConfirmPasswordObscured,
                          toggleVisibility: () {
                            setState(() {
                              isConfirmPasswordObscured =
                              !isConfirmPasswordObscured;
                            });
                          },
                        ),

                        const SizedBox(height: 25),

                        /// 🔥 BUTTON
                        InkWell(
                          onTap: _validateForm,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF1565C0),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blueAccent,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Register",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // MODERN INPUT FIELD
  Widget _modernField(
      TextEditingController controller,
      String hint,
      IconData icon, {
        bool isPassword = false,
        bool isNumber = false,
        required bool isObscured,
        required VoidCallback toggleVisibility,
      }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? isObscured : false,
      keyboardType:
      isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon, color: Colors.blue),

        suffixIcon: isPassword
            ? IconButton(
          onPressed: toggleVisibility,
          icon: Icon(
            isObscured
                ? Icons.visibility_off
                : Icons.visibility,
            color: Colors.blue,
          ),
        )
            : null,

        /// 🎯 OUTLINE BORDER
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),

        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  /// 📧 EMAIL VALIDATION
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$');
    return emailRegex.hasMatch(email);
  }

  /// ✅ FORM VALIDATION
  Future<void> _validateForm() async {
    final name = nameController.text.trim();
    final contact = contactController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        contact.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar(
          "Error",
          "All fields are required",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    } else if (contact.length != 10) {
      Get.snackbar(
          "Error",
          "Contact number must be 10 digits",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    } else if (!_isValidEmail(email)) {
      Get.snackbar(
          "Error",
          "Enter valid email",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    } else if (password.length < 6) {
      Get.snackbar(
          "Error",
          "Password must be 6+ chars",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    } else if (password != confirmPassword) {
      Get.snackbar(
          "Error",
          "Passwords do not match",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    } else {
      Get.snackbar(
          "Success",
          "Registration Successful",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );


      int result = await DatabaseHelper().insertAdmin(
          name: nameController.text.toString(),
          contact: contactController.text.toString(),
          email: emailController.text.toString(),
          password: passwordController.text.toString()


      );

      print("Admin Inserted : $result");

      Get.off(()=> HomeScreen());
    }
  }
}