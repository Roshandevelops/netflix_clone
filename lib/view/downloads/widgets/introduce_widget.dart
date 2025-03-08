import 'package:flutter/material.dart';
import 'package:netflix_project/view/downloads/widgets/transform_image_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class IntroduceWidget extends StatelessWidget {
  const IntroduceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = [
      "https://image.tmdb.org/t/p/w1280/31GlRQMiDunO8cl3NxTz34U64rf.jpg",
      "https://image.tmdb.org/t/p/w1280/jBn4LWlgdsf6xIUYhYBwpctBVsj.jpg",
      "https://image.tmdb.org/t/p/w1280/k9DaMmzL1cRkHbxrCBlP9rb9B5B.jpg",
      "https://www.themoviedb.org/t/p/w1280/xVS9XiO9upp2SnWx6KpBYb79hLR.jpg",
    ];
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          textAlign: TextAlign.center,
          "Introducing Downloads for you",
          style: TextStyle(fontSize: 20),
        ),
        kHeight,
        const Text(
          textAlign: TextAlign.center,
          "We will  download a personalised selection of\nmovies and shows for you,so there's\nalways something to watch on your\ndevice",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF433E3E),
                radius: size.width * 0.4,
              ),
              TransformImageWidget(
                borderRadius: 10,
                containerSize: Size(
                  size.width * 0.40,
                  size.width * 0.58,
                ),
                angleRotation: 20,
                imageList: imageList[0],
                margin: const EdgeInsets.only(
                  left: 150,
                  bottom: 30,
                ),
              ),
              TransformImageWidget(
                borderRadius: 10,
                containerSize: Size(
                  size.width * 0.40,
                  size.width * 0.58,
                ),
                angleRotation: -20,
                imageList: imageList[1],
                margin: const EdgeInsets.only(
                  right: 150,
                  bottom: 30,
                ),
              ),
              TransformImageWidget(
                borderRadius: 10,
                containerSize: Size(
                  size.width * 0.45,
                  size.width * 0.65,
                ),
                imageList: imageList[2],
                margin: const EdgeInsets.only(
                  left: 0,
                  bottom: 0,
                  top: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
