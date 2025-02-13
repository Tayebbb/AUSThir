import 'package:austhir/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
 
class SplashAnimation extends StatelessWidget {
  const SplashAnimation({super.key});
 
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    });
 
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity, 
        height: double.infinity, 
        child: Lottie.asset(
          'assets/splash_animation.json', 
          fit: BoxFit.contain, 
        ),
      ),
    );
  }
}
 