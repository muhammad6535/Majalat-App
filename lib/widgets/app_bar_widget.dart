// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/screens/Home_Screen.dart';
import 'package:majalat_app/screens/Volunteers_Screen.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage("assets/majalaat-icon.png"),
                width: 35,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text('مجالات', style: GoogleFonts.almarai()),
            ],
          ),
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                size: 30,
              ),
              itemBuilder: (BuildContext context) => [
                    option("1", "الرئيسيّة"),
                    option("2", "المتطوّعون"),
                    option("3", "روابط مفيدة"),
                    option("4", "عن مجالات"),
                  ],
              onSelected: (value) {
                handleSelectedOption(value);
              }),
        ],
      ),
    );
  }

  PopupMenuItem option(String value, String text) {
    return PopupMenuItem(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: GoogleFonts.almarai(fontSize: 15),
          ),
        ],
      ),
    );
  }

  handleSelectedOption(String value) {
    switch (value) {
      case '1':
        Get.replace(HomeScreen());
        break;
      case '2':
        Get.to(VolunteersScreen());
        break;
      case '3':
        break;
      case '4':
        break;
    }
  }
}