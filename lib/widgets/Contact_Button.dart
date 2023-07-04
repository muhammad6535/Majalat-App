// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatelessWidget {
  final double width;
  final double height;
  final String? text;
  final Color color;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String profileLink;

  const ContactButton(
      {required this.width,
      required this.height,
      required this.color,
      this.text,
      this.icon,
      super.key,
      this.onPressed,
      this.profileLink = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2,
          ),
        ],
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: TextButton(
        onPressed: icon == Icons.person
            ? () {}
            : () async {
                if (!await launchUrl(Uri.parse(profileLink),
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $profileLink');
                }
              },
        child: Center(
          child: text != null
              ? Text(
                  text!,
                  style: GoogleFonts.almarai(color: Colors.white, fontSize: 19),
                )
              : Icon(
                  icon,
                  color: icon == Icons.star_border ? Colors.grey : Colors.blue,
                  size: 30,
                ),
        ),
      ),
    );
  }
}
