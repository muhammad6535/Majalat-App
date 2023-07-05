// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/widgets/Volunteer_Dialog.dart';

class VolunteerCard extends StatelessWidget {
  final String name;
  final String description;
  final String majodOfStudy;
  final String universityName;
  final String city;
  final String summary;
  final String photoId;
  final String profileLink;
  final String howToContact;
  final String phoneNumber;

  const VolunteerCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.majodOfStudy,
      required this.summary,
      required this.city,
      required this.universityName,
      this.photoId = "",
      this.profileLink = "",
      this.howToContact = "",
      required this.phoneNumber})
      : super(key: key);

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: VolunteerDialog(
            name: name,
            majorOfStudy: majodOfStudy,
            summary: summary,
            city: city,
            universityName: universityName,
            photoId: photoId,
            profileLink: profileLink,
            howToContact: howToContact,
            phoneNumber: phoneNumber,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, right: 17, left: 17, bottom: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
              ),
            ],
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 15, top: 18, bottom: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        GoogleFonts.almarai(fontSize: 20, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      description,
                      style: GoogleFonts.almarai(color: Colors.grey[700]),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
