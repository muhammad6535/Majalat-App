// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/widgets/popup_menu_widget.dart';

class HelpfulLinksScreen extends StatelessWidget {
  const HelpfulLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "روابط مفيدة",
                  style: GoogleFonts.almarai(),
                ),
                const PopUpMenuWidget(currentPage: "helpfulLinks")
              ],
            ),
          ),
          body: Container(
            color: Color.fromARGB(183, 238, 242, 242),
            child: ListView(
              children: [
                Text("aaa"),
                Text("aaa"),
                Text("aaa"),
                Text("aaa"),
              ],
            ),
          )),
    );
  }
}
