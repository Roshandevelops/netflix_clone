import 'package:flutter/material.dart';
import 'package:netflix_project/view/home/widgets/number_card_widget.dart';
import 'package:netflix_project/widgets/title_widget.dart';

class TopTenWidgetTile extends StatelessWidget {
  const TopTenWidgetTile({super.key, required this.numberUrl});

  final List<String> numberUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          heading: "Top 10 Tv Shows in India Today",
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              numberUrl.length,
              (index) {
                return NumberCardWidget(
                  numberCardUrl: numberUrl[index],
                  index: index,
                  widthk: 140,
                  heightk: 200,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
