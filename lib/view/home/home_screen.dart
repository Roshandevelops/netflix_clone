import 'package:flutter/material.dart';
import 'package:netflix_project/view/home/widgets/number_card_widget.dart';
import 'package:netflix_project/view/home/widgets/top_ten_widget.dart';
import 'package:netflix_project/view/search/widgets/search_result_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/widgets/main_card_widget.dart';
import 'package:netflix_project/widgets/title_image_widget.dart';
import 'package:netflix_project/widgets/title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleImageWidget(
                  title: "Released in the Past Year",
                ),
                kHeight,
                TitleImageWidget(
                  title: "Trending Now",
                ),
                kHeight,
                TopTenWidgetTile(),
                kHeight,
                TitleImageWidget(title: "Tense Dramas"),
                kHeight,
                TitleImageWidget(title: "South Indian Cinema"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
