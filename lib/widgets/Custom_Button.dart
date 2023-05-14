// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.width,
      required this.text,
      required this.icon,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey[400] : Colors.grey[300],
          ),
          width: width,
          child: TextButton.icon(
            icon: Icon(icon),
            style: OutlinedButton.styleFrom(
                foregroundColor: isSelected ? Colors.black : Colors.grey),
            onPressed: onPressed,
            label: Text(
              text,
              style: GoogleFonts.almarai(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: isSelected ? 14 : 14,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          alignment: Alignment.topRight,
          duration: const Duration(milliseconds: 200),
          height: 3,
          width: isSelected ? MediaQuery.of(context).size.width * 0.5 : 0,
          color: Colors.blue,
        ),
      ],
    );
  }
}
