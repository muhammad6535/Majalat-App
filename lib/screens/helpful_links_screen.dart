// ignore_for_file: prefer_const_constructors, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/controller/data_controller.dart';
import 'package:majalat_app/widgets/popup_menu_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpfulLinksScreen extends StatefulWidget {
  const HelpfulLinksScreen({Key? key}) : super(key: key);

  @override
  _HelpfulLinksScreenState createState() => _HelpfulLinksScreenState();
}

class _HelpfulLinksScreenState extends State<HelpfulLinksScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    DataController dataController = Get.find();
    var categories = dataController.helpfulLinks
        .map((el) => el['category'])
        .toSet()
        .toList();
    categories.remove('الرجاء إضافة فلتر تخصصات');
    selectedCategory = categories.first;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToCategory(String category) {
    var linksToShow = Get.find<DataController>().helpfulLinks;
    var categoryIndex =
        linksToShow.indexWhere((el) => el['category'] == category);
    if (categoryIndex != -1) {}
  }

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
                Expanded(
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
                Expanded(
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
    var linksToShow = Get.find<DataController>()
        .helpfulLinks
        .where((el) => el['category'] == title)
        .toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
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
        Column(
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.find();
    var categories = dataController.helpfulLinks
        .map((el) => el['category'])
        .toSet()
        .toList();
    categories.remove('الرجاء إضافة فلتر تخصصات');
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
              const PopUpMenuWidget(currentPage: "helpfulLinks"),
            ],
          ),
        ),
        body: Container(
          color: Color.fromARGB(183, 238, 242, 242),
          child: SingleChildScrollView(
            controller: _scrollController,
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
                  SizedBox(height: 5),
                  DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                        scrollToCategory(selectedCategory!);
                      });
                    },
                    items: categories.map<DropdownMenuItem<String>>(
                      (var value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                value,
                                style: GoogleFonts.almarai(),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(height: 15),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildSection(selectedCategory!),
                      ],
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
