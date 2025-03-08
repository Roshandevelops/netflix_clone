import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class SmartDownloadsWidget extends StatelessWidget {
  const SmartDownloadsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text("Smart Downloads"),
        // kHeight20,
      ],
    );
  }
}
