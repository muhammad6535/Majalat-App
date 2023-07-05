// ignore_for_file: depend_on_referenced_packages, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactButton extends StatefulWidget {
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
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool isStarPressed = false;
  Color starColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2,
          ),
        ],
        color: isStarPressed && widget.icon == Icons.star_border
            ? starColor
            : widget.color,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: TextButton(
        onPressed:
            widget.icon == Icons.star_border ? onStarPressed : widget.onPressed,
        child: Center(
          child: widget.text != null
              ? Text(
                  widget.text!,
                  style: GoogleFonts.almarai(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                )
              : Icon(
                  isStarPressed ? Icons.star : widget.icon,
                  color: widget.icon == Icons.star_border
                      ? isStarPressed
                          ? Colors.white
                          : Colors.grey
                      : Colors.blue,
                  size: 30,
                ),
        ),
      ),
    );
  }

  void onStarPressed() {
    setState(() {
      isStarPressed = !isStarPressed;
      starColor = isStarPressed ? Color(0xffffc107) : Colors.white;
    });
  }
}
