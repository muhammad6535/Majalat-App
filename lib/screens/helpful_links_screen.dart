// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/widgets/popup_menu_widget.dart';

class HelpfulLinksScreen extends StatelessWidget {
  const HelpfulLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  child: Column(
                    children: [
                      Text(
                        "هل لديكم أي رابط أو مرجع مفيد للطلاب أو المقبلين على التعليم؟ شاركوهم به الآن!",
                        style: GoogleFonts.almarai(
                            color: Colors.black87, height: 1.2, fontSize: 18),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: size.width * 0.72,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "اقتراح رابط مفيد",
                            style: GoogleFonts.almarai(
                                color: Colors.black87, fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow.shade700),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 0.7,
                        width: size.width * 0.72,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      buildSection("مواقع الجامعات والكليات"),
                      SizedBox(
                        height: 15,
                      ),
                      buildSection("مواقع الجامعات والكليات")
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

Widget buildSection(String title) {
  return Container(
      child: Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.almarai(color: Colors.blue.shade600, fontSize: 21),
        ),
      ],
    ),
    SizedBox(
      height: 25,
    ),
    linkCard(),
    linkCard(),
    linkCard(),
    linkCard(),
    linkCard(),
  ]));
}

Widget linkCard() {
  return InkWell(
    onTap: () {},
    splashColor: Colors.grey.shade700,
    child: Padding(
      padding: const EdgeInsets.only(right: 14, bottom: 28),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.link, color: Colors.grey.shade600),
              SizedBox(
                width: 5,
              ),
              Text(
                "موقع التخنيون",
                style: GoogleFonts.almarai(
                    fontWeight: FontWeight.bold, fontSize: 19),
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                "الموقع الرسمي لمعهد التخنيون",
                style: GoogleFonts.almarai(
                    fontSize: 18, color: Colors.grey.shade600),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
