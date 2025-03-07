import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class MovieNameAndContentWidget extends StatelessWidget {
  const MovieNameAndContentWidget({
    super.key,
    required this.content,
    required this.movieName,
  });
  final String movieName;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        kHeight,
        Text(
          content,
          style: TextStyle(
            fontSize: 15,
            color: kGreyColor,
          ),
        ),
      ],
    );
  }
}
