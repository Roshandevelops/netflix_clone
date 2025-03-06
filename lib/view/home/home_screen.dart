import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_project/view/home/widgets/background_card_widget.dart';
import 'package:netflix_project/view/home/widgets/number_card_widget.dart';
import 'package:netflix_project/view/home/widgets/top_ten_widget.dart';
import 'package:netflix_project/view/search/widgets/search_result_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/view/home/widgets/custom_button_widget.dart';
import 'package:netflix_project/widgets/main_card_widget.dart';
import 'package:netflix_project/widgets/title_image_widget.dart';
import 'package:netflix_project/widgets/title_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext ctx, index, _) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                log(direction.toString());

                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      BackgroundCardWidget(),
                      kHeight20,
                      TitleImageWidget(title: "Released in the Past Year"),
                      kHeight,
                      TitleImageWidget(title: "Trending Now"),
                      kHeight,
                      TopTenWidgetTile(),
                      kHeight,
                      TitleImageWidget(title: "Tense Dramas"),
                      kHeight,
                      TitleImageWidget(title: "South Indian Cinema"),
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          height: 90,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.1),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://www.citypng.com/public/uploads/preview/round-netflix-logo-701751694792607bemlfazrrl.png",
                                    width: 50,
                                    height: 60,
                                  ),
                                  Spacer(),
                                  const Icon(Icons.cast, color: kWhiteColor),
                                  kWidth,
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.amber,
                                  ),
                                  kWidth
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Tv Shows",
                                    style: kHomeTitleText,
                                  ),
                                  Text(
                                    "Movies",
                                    style: kHomeTitleText,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Categories",
                                        style: kHomeTitleText,
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_rounded,
                                        size: 30,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight,
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
