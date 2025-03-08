import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.buttoncolor,
    required this.text,
    required this.fontColor,
    this.buttonHeight,
    required this.buttonWidth,
  });
  final Color? buttoncolor;
  final String text;
  final Color fontColor;
  final double? buttonWidth;
  final double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: MaterialButton(
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
      ),
    );
  }
}
