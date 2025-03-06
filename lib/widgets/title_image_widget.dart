import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/widgets/main_card_widget.dart';
import 'package:netflix_project/widgets/title_widget.dart';

class TitleImageWidget extends StatelessWidget {
  const TitleImageWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          heading: title,
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) {
                return Row(
                  children: [
                    MainCardWidget(
                      width: 120,
                      height: 200,
                    ),
                    kWidth,
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
