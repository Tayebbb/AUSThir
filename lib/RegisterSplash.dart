// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:async'; // To use Timer
import 'package:lottie/lottie.dart';
import 'package:austhir/reg.dart'; // Import the registration page (reg.dart)

class RegisterSplash extends StatefulWidget {
  const RegisterSplash({super.key});

  @override
  _RegisterSplashState createState() => _RegisterSplashState();
}

class _RegisterSplashState extends State<RegisterSplash> {
  @override
  void initState() {
    super.initState();

    // Wait for the animation to complete (after 3 seconds)
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const Reg()), // Go to reg.dart after animation
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/animation2.json', // This is the animation file you want to show
          width: 250, // Adjust the size as needed
          height: 250, // Adjust the size as needed
        ),
      ),
    );
  }
}
