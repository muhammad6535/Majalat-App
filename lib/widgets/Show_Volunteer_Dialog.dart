// ignore_for_file: depend_on_referenced_packages, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/widgets/Contact_Button.dart';

class VolunteerDialog extends StatelessWidget {
  final String name;
  final String universityName;
  final String majorOfStudy;
  final String city;
  final String summary;
  final String photoId;

  const VolunteerDialog(
      {super.key,
      required this.name,
      required this.universityName,
      required this.majorOfStudy,
      required this.city,
      required this.summary,
      this.photoId = ""});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Column(
        children: [
          Visibility(
            visible: photoId == "" ? false : true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 17, top: 8),
              child: CircleAvatar(
                radius: 65.0,
                backgroundColor: Colors.grey.shade400,
                backgroundImage: NetworkImage(
                    'https://drive.google.com/uc?export=view&id=$photoId'),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.almarai(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(25),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance, color: Colors.grey.shade700),
                const SizedBox(
                  width: 7,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    "$universityName - $majorOfStudy",
                    style: GoogleFonts.almarai(
                        color: Colors.grey[700],
                        letterSpacing: 0.5,
                        height: 1.1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey.shade700),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    city,
                    style: GoogleFonts.almarai(
                        color: Colors.grey[700],
                        letterSpacing: 0.5,
                        height: 1.4),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                summary,
                style: GoogleFonts.almarai(
                    color: Colors.grey[700], letterSpacing: 0.5, height: 1.4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, bottom: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactButton(
                      color: Colors.grey.shade300,
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: MediaQuery.of(context).size.height * 0.12,
                      icon: Icons.person),
                  ContactButton(
                    color: Colors.blue.shade400,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.12,
                    text: "أريد التواصل",
                  ),
                  ContactButton(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: MediaQuery.of(context).size.height * 0.12,
                      icon: Icons.star_border),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
