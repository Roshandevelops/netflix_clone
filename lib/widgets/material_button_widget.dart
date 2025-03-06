import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {super.key,
      required this.buttoncolor,
      required this.text,
      required this.fontColor});
  final Color? buttoncolor;
  final String text;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: buttoncolor,
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: fontColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
