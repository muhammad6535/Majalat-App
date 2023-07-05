// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/favorites_controller.dart';

class ContactButton extends StatefulWidget {
  final double width;
  final double height;
  final String? text;
  final Color color;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String profileLink;
  final String phone;

  const ContactButton({
    required this.width,
    required this.height,
    required this.color,
    this.text,
    this.icon,
    super.key,
    this.onPressed,
    this.profileLink = "",
    required this.phone,
  });

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  FavoritesController favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoritesController.favList.contains(widget.phone);

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
        color: isFavorite &&
                (widget.icon == Icons.star_border || widget.icon == Icons.star)
            ? Color(0xffffc107)
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
                  isFavorite &&
                          (widget.icon == Icons.star_border ||
                              widget.icon == Icons.star)
                      ? Icons.star
                      : widget.icon,
                  color: widget.icon == Icons.star_border
                      ? Colors.grey
                      : Colors.blue,
                  size: 30,
                ),
        ),
      ),
    );
  }

  void onStarPressed() {
    bool isFavorite = favoritesController.favList.contains(widget.phone);

    setState(() {
      if (isFavorite) {
        favoritesController.removeFromFavorite(widget.phone);
      } else {
        favoritesController.addToFavorite(widget.phone);
      }
    });
  }
}
