// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/screens/Home_Screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.blue.shade600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/majalaat-icon.png"),
              width: size.width * 0.62,
              height: size.height * 0.25,
              color: Colors.white,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "مجالات",
              style: GoogleFonts.almarai(
                  fontSize: size.width * 0.15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
