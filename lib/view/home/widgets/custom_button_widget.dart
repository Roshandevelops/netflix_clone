import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.iconData,
      required this.text,
      this.iconSize = 30,
      this.textSize = 15,
      this.fontColor});
  final IconData iconData;
  final String text;
  final double iconSize;
  final double textSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: iconSize,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
