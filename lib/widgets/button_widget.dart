import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
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
