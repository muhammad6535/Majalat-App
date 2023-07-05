// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        color: Colors.blue.shade700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/majalaat-icon.png"),
              width: size.width * 0.62,
              color: Colors.white,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "مجالات",
              style: GoogleFonts.almarai(fontSize: 62, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
