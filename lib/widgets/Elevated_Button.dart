import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final Size minimumSize;
  final Widget nextScreen;

  const ElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.backgroundColor,
    required this.borderRadius,
    required this.minimumSize,
    required this.nextScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
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
