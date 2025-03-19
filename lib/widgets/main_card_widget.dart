import 'package:flutter/material.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/widgets/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
    required this.width,
    this.height,
    this.searchModel,
    this.imageUrl,
    this.newAndHotModel,
  });
  final double? width;
  final double? height;
  final MovieModel? searchModel;
  final MovieModel? newAndHotModel;

  // final NewAndHotModel? newAndHotModel;

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    String finalImageUrl = imageUrl ??
        (searchModel?.posterPath != null
            ? "$imageAppendUrl${searchModel!.posterPath}"
            : newAndHotModel?.posterPath != null
                ? "$imageAppendUrl${newAndHotModel!.posterPath}"
                : "https://media.themoviedb.org/t/p/w500_and_h282_face/kYgQzzjNis5jJalYtIHgrom0gOx.jpg");
    if (finalImageUrl.isEmpty) {
      finalImageUrl =
          "https://media.themoviedb.org/t/p/w500_and_h282_face/kYgQzzjNis5jJalYtIHgrom0gOx.jpg";
    }
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF4F4C4C),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(finalImageUrl),
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
