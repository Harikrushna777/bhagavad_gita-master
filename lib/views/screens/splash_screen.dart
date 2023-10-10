import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:json_app/utils/my_page_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void mySplashScreen() {
    Timer.periodic(
      const Duration(seconds: 5),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyPageRoute.home);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    mySplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Bhagavad Gita",
              style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.blue,
              ),
            ),
            Text(
              "Application",
              style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 130),
            Text(
              "Please Wait...",
              style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
