// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/screens/Home_Screen.dart';
import 'package:majalat_app/screens/Volunteers_Screen.dart';
import 'package:majalat_app/screens/about_majalaat_screen.dart';
import 'package:majalat_app/screens/helpful_links_screen.dart';

class PopUpMenuWidget extends StatelessWidget {
  final String currentPage;
  const PopUpMenuWidget({required this.currentPage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
        });
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
        if (currentPage != "home") Get.offAll(() => HomeScreen());
        break;
      case '2':
        if (currentPage != "volunteers") Get.to(() => VolunteersScreen());
        break;
      case '3':
        if (currentPage != "helpfulLinks") Get.to(() => HelpfulLinksScreen());

        break;
      case '4':
        if (currentPage != "about") Get.to(() => AboutMajalaatScreen());

        break;
    }
  }
}
