import 'package:flutter/material.dart';
import 'package:netflix_project/view/home/widgets/custom_button_widget.dart';
import 'package:netflix_project/view/new_hot/widgets/moviename_content_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/widgets/stack_image_icon_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String movieName;
  final String posterPath;
  final String description;
  const EveryonesWatchingWidget({
    super.key,
    required this.movieName,
    required this.posterPath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieNameAndContentWidget(
            content: description,
            movieName: movieName,
          ),
          kHeight50,
          StackImageIconWidget(
            posterPath: posterPath,
          ),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                iconData: Icons.share,
                text: "Share",
                fontColor: kGreyColor,
              ),
              kWidth20,
              CustomButtonWidget(
                iconData: Icons.add,
                text: "My List",
                fontColor: kGreyColor,
              ),
              kWidth20,
              CustomButtonWidget(
                iconData: Icons.play_arrow,
                text: "Play",
                fontColor: kGreyColor,
              ),
              kWidth,
            ],
          )
        ],
      ),
    );
  }
}
