// ignore_for_file: depend_on_referenced_packages, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/widgets/Contact_Button.dart';
import 'package:majalat_app/widgets/contact_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class VolunteerDialog extends StatefulWidget {
  final String name;
  final String universityName;
  final String majorOfStudy;
  final String city;
  final String summary;
  final String photoId;
  final String profileLink;
  final String howToContact;

  const VolunteerDialog(
      {super.key,
      required this.name,
      required this.universityName,
      required this.majorOfStudy,
      required this.city,
      required this.summary,
      this.photoId = "",
      this.profileLink = "",
      required this.howToContact});

  @override
  State<VolunteerDialog> createState() => _VolunteerDialogState();
}

class _VolunteerDialogState extends State<VolunteerDialog> {
  @override
  Widget build(BuildContext context) {
    Color starButtonColor = Colors.white; // Initial button color
    IconData icon = Icons.person;
    if (widget.profileLink.contains("facebook")) {
      icon = FontAwesomeIcons.facebook;
    }
    if (widget.profileLink.contains("linkedin")) {
      icon = FontAwesomeIcons.linkedin;
    }
    return SimpleDialog(
      title: Column(
        children: [
          Visibility(
            visible: widget.photoId == "" ? false : true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 17, top: 8),
              child: CircleAvatar(
                radius: 65.0,
                backgroundColor: Colors.grey.shade400,
                backgroundImage: NetworkImage(
                    'https://drive.google.com/uc?export=view&id=${widget.photoId}'),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.almarai(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(20),
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
                    "${widget.universityName} - ${widget.majorOfStudy}",
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
                    widget.city,
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
                widget.summary,
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
                    icon: icon,
                    profileLink: widget.profileLink,
                    onPressed: icon == Icons.person
                        ? () {}
                        : () async {
                            if (!await launchUrl(Uri.parse(widget.profileLink),
                                mode: LaunchMode.externalApplication)) {
                              throw Exception(
                                  'Could not launch $widget.profileLink');
                            }
                          },
                  ),
                  ContactButton(
                    color: Colors.blue.shade400,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.12,
                    text: "أريد التواصل",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: ContactDialog(
                              name: widget.name,
                              howToContact: widget.howToContact,
                            )),
                      );
                    },
                  ),
                  ContactButton(
                    color: starButtonColor, // Use the color variable here
                    width: MediaQuery.of(context).size.width * 0.14,
                    height: MediaQuery.of(context).size.height * 0.12,
                    icon: Icons.star_border,
                    onPressed: () {
                      setState(() {
                        starButtonColor = Colors.white;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
