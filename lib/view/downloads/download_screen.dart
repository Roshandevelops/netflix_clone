import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/app_bar_widget.dart';
import 'package:netflix_project/widgets/button_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/widgets/transform_image_widget.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = [
      "https://image.tmdb.org/t/p/w1280/31GlRQMiDunO8cl3NxTz34U64rf.jpg",
      "https://image.tmdb.org/t/p/w1280/jBn4LWlgdsf6xIUYhYBwpctBVsj.jpg",
      "https://image.tmdb.org/t/p/w1280/k9DaMmzL1cRkHbxrCBlP9rb9B5B.jpg",
      "https://www.themoviedb.org/t/p/w1280/xVS9XiO9upp2SnWx6KpBYb79hLR.jpg",
    ];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Downloads"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: kWhiteColor,
                  ),
                  kWidth,
                  Text("Smart Downloads")
                ],
              ),
              kHeight,
              const Text(
                textAlign: TextAlign.center,
                "Introducing Downloads for you",
                style: TextStyle(fontSize: 20),
              ),
              kHeight,
              const Text(
                textAlign: TextAlign.center,
                "We will  download a personalised selection of\nmovies and shows for you,so there's\nalways something to watch on your\ndevice",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                // color: Colors.black,
                width: size.width,
                height: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFF433E3E),
                      radius: size.width * 0.38,
                    ),
                    TransformImageWidget(
                      angleRotation: 20,
                      imageList: imageList[0],
                      margin: const EdgeInsets.only(left: 130, bottom: 50),
                    ),
                    TransformImageWidget(
                      angleRotation: -20,
                      imageList: imageList[1],
                      margin: const EdgeInsets.only(right: 130, bottom: 50),
                    ),
                    TransformImageWidget(
                      imageList: imageList[2],
                      margin: const EdgeInsets.only(left: 0),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                buttoncolor: kButtonColorBlue,
                text: "Set Up",
                fontColor: kWhiteColor,
              ),
              const ButtonWidget(
                buttoncolor: kButtonColorWhite,
                text: "See What You Can Download",
                fontColor: kBlackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
