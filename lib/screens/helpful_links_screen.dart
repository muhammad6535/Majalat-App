// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/controller/data_controller.dart';
import 'package:majalat_app/widgets/popup_menu_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpfulLinksScreen extends StatelessWidget {
  const HelpfulLinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.find();
    var categories = dataController.helpfulLinks
        .map((el) => el['category'])
        .toSet()
        .toList();
    categories.remove('الرجاء إضافة فلتر تخصصات');
    Size size = MediaQuery.of(context).size;

    Widget linkCard(String title, String description, String url) {
      return InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(url),
              mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $url');
          }
        },
        splashColor: Colors.grey.shade700,
        child: Padding(
          padding: const EdgeInsets.only(right: 14, bottom: 22),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.link, color: Colors.grey.shade600),
                  SizedBox(width: 5),
                  SizedBox(
                    width: size.width * 0.7,
                    child: Text(
                      title,
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: Text(
                      description,
                      style: GoogleFonts.almarai(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget buildSection(String title) {
      var linksToShow = dataController.helpfulLinks
          .where((el) => el['category'] == title)
          .toList()
          .obs;

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.8,
                child: Text(
                  title,
                  style: GoogleFonts.almarai(
                    color: Colors.blue.shade600,
                    fontSize: 21,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Obx(
            () => Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: linksToShow.length,
                  itemBuilder: (context, index) {
                    var link = linksToShow[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        linkCard(
                          link['title'].toString(),
                          link['description'].toString(),
                          link['url'].toString(),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

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
              const PopUpMenuWidget(currentPage: "helpfulLinks"),
            ],
          ),
        ),
        body: Container(
          color: Color.fromARGB(183, 238, 242, 242),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                children: [
                  Text(
                    "هل لديكم أي رابط أو مرجع مفيد للطلاب أو المقبلين على التعليم؟ شاركوهم به الآن!",
                    style: GoogleFonts.almarai(
                      color: Colors.black87,
                      height: 1.2,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: size.width * 0.72,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        var url =
                            "https://docs.google.com/forms/d/e/1FAIpQLSey0XS4vuBfbERbsL9Dfjoi92HK_TU_Hyv7YzXNxCYQDsF8pA/viewform";
                        if (!await launchUrl(Uri.parse(url),
                            mode: LaunchMode.externalApplication)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Text(
                        "اقتراح رابط مفيد",
                        style: GoogleFonts.almarai(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade700,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 0.7,
                    width: size.width * 0.72,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: buildSection(categories[index]),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
