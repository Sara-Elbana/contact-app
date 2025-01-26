import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29384D),
      body: Center(
        child: Image.asset(
          "assets/images/route-logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
