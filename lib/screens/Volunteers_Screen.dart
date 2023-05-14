// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:majalat_app/widgets/Custom_Button.dart';
import 'package:majalat_app/widgets/Search_Input.dart';
import 'package:majalat_app/widgets/Volunteer_Card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/data/Volunteers_Data.dart';

class VolunteersScreen extends StatefulWidget {
  const VolunteersScreen({Key? key}) : super(key: key);

  @override
  _VolunteersScreenState createState() => _VolunteersScreenState();
}

class _VolunteersScreenState extends State<VolunteersScreen> {
  bool isSelected = true;

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
                    isSelected: isSelected,
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.5,
                    text: "المفضلة",
                    icon: Icons.star,
                    isSelected: !isSelected,
                    onPressed: () {
                      setState(() {
                        isSelected = false;
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
                  itemCount: isSelected
                      ? VolunteerData.volunteers.length
                      : VolunteerData.favorites.length,
                  itemBuilder: (context, index) {
                    return isSelected
                        ? VolunteerData.volunteers[index]
                        : VolunteerData.favorites[index];
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
