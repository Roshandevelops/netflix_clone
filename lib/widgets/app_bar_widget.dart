import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: kWhiteColor),
      ),
      actions: [
        const Icon(Icons.cast, color: kWhiteColor),
        kWidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.amber,
        ),
        kWidth
      ],
    );
  }
}
