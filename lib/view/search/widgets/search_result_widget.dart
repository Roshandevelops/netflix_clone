import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/main_card_widget.dart';
import 'package:netflix_project/widgets/title_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

const dummyImageUrl =
    "https://image.tmdb.org/t/p/w1280/31GlRQMiDunO8cl3NxTz34U64rf.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(heading: "Movies & TV"),
        kHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 2,
            childAspectRatio: 1 / 1.4,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              20,
              (index) {
                return const MainCardWidget(
                  height: 200,
                  width: 120,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
