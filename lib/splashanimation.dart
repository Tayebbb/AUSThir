import 'package:austhir/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity, // Takes full screen width
        height: double.infinity, // Takes full screen height
        child: Lottie.asset(
          'assets/splash_animation.json', // Path to your Lottie JSON
          fit: BoxFit.contain, // Keeps the main content centered
        ),
      ),
    );
  }
}
