import 'package:flutter/material.dart';

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget(
      {super.key, required this.iconData, required this.title});

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            iconData,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
