import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_manager/utils/app_colors.dart';
import 'package:student_manager/view/auth/register_screen.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Timer(const Duration(seconds: 4), () {
      Get.offAll(() => const RegisterScreen());
      // Get.offAll(() => const HomeScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/app_icon.png",
                  height: 200,
                  width: 300,
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "The EasyLearn Academy",
                  style: GoogleFonts.poppins(color: AppColors.primary, fontWeight: FontWeight.bold,fontSize: 25),
                ),
                const SizedBox(height: 10),

            Text(
              "Empowering Students Through Quality Education",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                letterSpacing: 0.5,
              ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}