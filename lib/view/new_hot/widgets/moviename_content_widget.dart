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
          maxLines: 1,
          movieName,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        kHeight,
        Text(
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          content,
          style: const TextStyle(
            fontSize: 15,
            color: kGreyColor,
          ),
        ),
      ],
    );
  }
}
