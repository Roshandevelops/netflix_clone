import 'package:flutter/material.dart';
import 'package:netflix_project/view/home/widgets/custom_button_widget.dart';
import 'package:netflix_project/view/new_hot/widgets/moviename_content_widget.dart';
import 'package:netflix_project/widgets/stack_image_icon_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String movieName;
  final String posterPath;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.movieName,
    required this.day,
    required this.description,
    required this.id,
    required this.month,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          // color: Colors.red,
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kHeight20,
              Text(
                month,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          // color: Colors.amberAccent,
          width: size.width - 60,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StackImageIconWidget(
                posterPath: posterPath,
              ),
              kHeight20,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: -2,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        iconData: Icons.notification_important,
                        text: "Remind me",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        iconData: Icons.info,
                        text: "Info",
                        textSize: 12,
                        iconSize: 20,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              Text("Coming on $day $month"),
              kHeight20,
              MovieNameAndContentWidget(
                content: description,
                movieName: movieName,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
