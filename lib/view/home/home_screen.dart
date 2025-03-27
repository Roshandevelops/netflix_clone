import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_project/controller/home_provider.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/view/home/widgets/background_card_widget.dart';

import 'package:netflix_project/view/home/widgets/top_ten_widget.dart';

import 'package:netflix_project/widgets/constants.dart';

import 'package:netflix_project/widgets/title_image_widget.dart';
import 'package:provider/provider.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<HomeProvider>(context, listen: false)
          .getHomeScreenData();
    });

    super.initState();
  }

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
                Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                    if (homeProvider.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (homeProvider.pastYearList.isEmpty) {
                      return const Center(
                        child: Text('Empty List'),
                      );
                    } else {
                      final releasedPastYear = homeProvider.pastYearList.map(
                        (e) {
                          return "$imageAppendUrl${e.posterPath}";
                        },
                      ).toList();

                      final trendingNow = homeProvider.trendingList.map(
                        (e) {
                          return "$imageAppendUrl${e.posterPath}";
                        },
                      ).toList();
                      final tenseDramas = homeProvider.tenseDramasList.map(
                        (e) {
                          return "$imageAppendUrl${e.posterPath}";
                        },
                      ).toList();
                      final southIndian = homeProvider.southIndianList.map(
                        (e) {
                          return "$imageAppendUrl${e.posterPath}";
                        },
                      ).toList();
                      final topTen = homeProvider.topTenList.map(
                        (e) {
                          return "$imageAppendUrl${e.posterPath}";
                        },
                      ).toList();

                      return ListView(
                        children: [
                          const BackgroundCardWidget(),
                          kHeight20,
                          TitleImageWidget(
                            title: "Released in the Past Year",
                            posterList: releasedPastYear,
                          ),
                          kHeight,
                          TitleImageWidget(
                            title: "Trending Now",
                            posterList: trendingNow,
                          ),
                          kHeight,
                          TopTenWidgetTile(
                            numberUrl: topTen.length > 10
                                ? topTen.sublist(0, 10)
                                : topTen,
                          ),
                          kHeight,
                          TitleImageWidget(
                            title: "Tense Dramas",
                            posterList: tenseDramas,
                          ),
                          kHeight,
                          TitleImageWidget(
                            title: "South Indian Cinema",
                            posterList: southIndian,
                          ),
                          kHeight,
                        ],
                      );
                    }
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
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
                                const Spacer(),
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ));
      },
    ));
  }
}
