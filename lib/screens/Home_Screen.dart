// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, file_names
import 'package:flutter/material.dart';
import 'package:majalat_app/screens/volunteers_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('مجالات', style: GoogleFonts.almarai()),
        ),
        body: Container(
          color: Color.fromARGB(183, 238, 242, 242),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/majalaat-icon.png"),
                  width: 200,
                  height: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButtonWidget(
                  text: "تصفح المتطوعين",
                  fontSize: 20,
                  backgroundColor: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(10),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.8, 50),
                  nextScreen: VolunteersScreen(),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButtonWidget(
                  text: "انضمام كمتطوع",
                  fontSize: 20,
                  backgroundColor: Colors.yellow.shade800,
                  borderRadius: BorderRadius.circular(10),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.8, 50),
                  nextScreen: VolunteersScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
