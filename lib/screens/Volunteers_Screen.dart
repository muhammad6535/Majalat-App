// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:majalat_app/widgets/Custom_Button.dart';
import 'package:majalat_app/widgets/Search_Input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/data/Volunteers_Data.dart';
import 'package:majalat_app/widgets/Volunteer_Card.dart';

class VolunteersScreen extends StatefulWidget {
  const VolunteersScreen({Key? key}) : super(key: key);
  static List<VolunteerCard> listToShow = VolunteerData.volunteers;
  static bool isSelected = true;

  @override
  _VolunteersScreenState createState() => _VolunteersScreenState();
}

class _VolunteersScreenState extends State<VolunteersScreen> {
  @override
  Widget build(BuildContext context) {
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
                        VolunteersScreen.listToShow = VolunteerData.volunteers;
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
                        VolunteersScreen.listToShow = VolunteerData.favorites;

                        VolunteersScreen.isSelected = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SearchInput(),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: VolunteersScreen.listToShow.length,
                  itemBuilder: (context, index) {
                    return VolunteersScreen.listToShow[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
