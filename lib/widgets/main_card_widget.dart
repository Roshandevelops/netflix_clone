import 'package:flutter/material.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/widgets/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget(
      {super.key,
      required this.width,
      this.height,
      required this.searchModel,
      this.imageUrl});
  final double? width;
  final double? height;
  final MovieModel? searchModel;

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    String imageUrl = searchModel?.posterPath != null
        ? "$imageAppendUrl${searchModel!.posterPath}"
        : "https://media.themoviedb.org/t/p/w500_and_h282_face/kYgQzzjNis5jJalYtIHgrom0gOx.jpg";
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF4F4C4C),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
            borderRadius: kBorderradius,
          ),
        ),
        // kWidth,
        kHeight,
      ],
    );
  }
}
