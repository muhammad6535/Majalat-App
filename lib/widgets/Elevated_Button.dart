// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLScTF9AHiqFggAVP4kPz29nRpVNr5IP_XNmm8uMUlVxzaGe2qg/alreadyresponded');

class ElevatedButtonWidget extends StatelessWidget {
  final int id;
  final String text;
  final double fontSize;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final Size minimumSize;
  final Widget nextScreen;

  void _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  const ElevatedButtonWidget(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.backgroundColor,
      required this.borderRadius,
      required this.minimumSize,
      required this.nextScreen,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        id == 1
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextScreen),
              )
            : _launchUrl();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        minimumSize: minimumSize,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
