import 'package:flutter/material.dart';
import 'package:netflix_project/controller/home_provider.dart';
import 'package:netflix_project/models/new_hot_model.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/widgets/main_card_widget.dart';
import 'package:netflix_project/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class TitleImageWidget extends StatelessWidget {
  const TitleImageWidget({
    super.key,
    required this.title,
    required this.posterList,
    this.newAndHotModel,
  });

  final String title;
  final List<String> posterList;
  final NewAndHotModel? newAndHotModel;

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
          child: Consumer<HomeProvider>(builder: (context, value, child) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                posterList.length,
                (index) {
                  return Row(
                    children: [
                      MainCardWidget(
                        newAndHotModel: value.pastYearList[index],
                        width: 120,
                        height: 200,
                        // searchModel: null,
                      ),
                      kWidth,
                    ],
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}
