import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/widgets/main_card_widget.dart';
import 'package:netflix_project/widgets/title_widget.dart';

class TitleImageWidget extends StatelessWidget {
  const TitleImageWidget(
      {super.key, required this.title, required this.posterList});

  final String title;
  final List<String> posterList;

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
              posterList.length,
              (index) {
                return Row(
                  children: [
                    MainCardWidget(
                      imageUrl: posterList[index],
                      width: 120,
                      height: 200,
                      searchModel: null,
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
