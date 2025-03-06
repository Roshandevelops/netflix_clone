import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.iconData,
    required this.text,
  });
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 30,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
