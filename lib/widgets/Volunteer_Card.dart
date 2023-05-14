// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteerCard extends StatelessWidget {
  final String name;
  final String description;
  final String majodOfStudy;
  final String universityName;
  final String city;
  final String summary;

  const VolunteerCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.majodOfStudy,
      required this.summary,
      required this.city,
      required this.universityName})
      : super(key: key);

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: SimpleDialog(
          title: Text(
            name,
            style:
                GoogleFonts.almarai(fontSize: 22, fontWeight: FontWeight.bold),
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
                        "$universityName - $majodOfStudy",
                        style: GoogleFonts.almarai(color: Colors.grey[700]),
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
                        style: GoogleFonts.almarai(color: Colors.grey[700]),
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
                    style: GoogleFonts.almarai(color: Colors.grey[700]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("1"), Text("2"), Text("3")],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
          height: 96,
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
                  Text(
                    description,
                    style: GoogleFonts.almarai(color: Colors.grey[600]),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
