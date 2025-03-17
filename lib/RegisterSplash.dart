import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:austhir/reg.dart';

class RegisterSplash extends StatefulWidget {
  const RegisterSplash({super.key});

  @override
  _RegisterSplashState createState() => _RegisterSplashState();
}

class _RegisterSplashState extends State<RegisterSplash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Reg()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/animation2.json',
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
