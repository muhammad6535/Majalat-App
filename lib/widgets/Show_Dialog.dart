import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/widgets/Dialog_Button.dart';

class VolunteerDialog extends StatelessWidget {
  final String name;
  final String universityName;
  final String majorOfStudy;
  final String city;
  final String summary;

  const VolunteerDialog({
    super.key,
    required this.name,
    required this.universityName,
    required this.majorOfStudy,
    required this.city,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        name,
        style: GoogleFonts.almarai(fontSize: 22, fontWeight: FontWeight.bold),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [DialogButton(), DialogButton()],
                  ),
                  DialogButton(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
