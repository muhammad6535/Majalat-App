// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majalat_app/controller/data_controller.dart';
import 'package:majalat_app/widgets/Custom_Button.dart';
import 'package:majalat_app/widgets/Search_Input.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteersScreen extends StatefulWidget {
  const VolunteersScreen({Key? key}) : super(key: key);
  static bool isSelected = true;

  @override
  _VolunteersScreenState createState() => _VolunteersScreenState();
}

class _VolunteersScreenState extends State<VolunteersScreen> {
  String? searchQuery;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());

    List listToShow = dataController.volunteersList;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('المتطوعون', style: GoogleFonts.almarai()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.5,
                    text: "جميع المتطوعين",
                    icon: Icons.people_alt,
                    isSelected: VolunteersScreen.isSelected,
                    onPressed: () {
                      setState(() {
                        // VolunteersScreen.listToShow = dataController.volunteers;
                        VolunteersScreen.isSelected = true;
                      });
                    },
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.5,
                    text: "المفضلة",
                    icon: Icons.star,
                    isSelected: !VolunteersScreen.isSelected,
                    onPressed: () {
                      setState(() {
                        // VolunteersScreen.listToShow = VolunteerData.favorites;
                        VolunteersScreen.isSelected = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SearchInput(
                onSearchQueryChanged: (query) {
                  setState(() {
                    searchQuery = query;
                    count = listToShow
                        .where((volunteer) =>
                            searchQuery == null ||
                            searchQuery!.isEmpty ||
                            volunteer.name
                                .toLowerCase()
                                .contains(searchQuery!.toLowerCase()) ||
                            volunteer.description
                                .toLowerCase()
                                .contains(searchQuery!.toLowerCase()))
                        .length;
                  });
                },
              ),
              Visibility(
                visible:
                    searchQuery == null || searchQuery!.isEmpty ? false : true,
                child: Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("عدد نتائج البحث:  $count",
                      style: GoogleFonts.almarai(
                          fontSize: 18, color: Colors.grey[700])),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Obx(
                () => SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 320),
                    child: ListView.builder(
                      itemCount: listToShow
                          .where((volunteer) =>
                              searchQuery == null ||
                              searchQuery!.isEmpty ||
                              volunteer.name
                                  .toLowerCase()
                                  .contains(searchQuery!.toLowerCase()) ||
                              volunteer.description
                                  .toLowerCase()
                                  .contains(searchQuery!.toLowerCase()))
                          .length,
                      itemBuilder: (context, index) {
                        final filteredList = listToShow
                            .where((volunteer) =>
                                searchQuery == null ||
                                searchQuery!.isEmpty ||
                                volunteer.name
                                    .toLowerCase()
                                    .contains(searchQuery!.toLowerCase()) ||
                                volunteer.description
                                    .toLowerCase()
                                    .contains(searchQuery!.toLowerCase()))
                            .toList();
                        return filteredList[index];
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
