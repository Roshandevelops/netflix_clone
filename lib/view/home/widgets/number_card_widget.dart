import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class NumberTileWidget extends StatelessWidget {
  const NumberTileWidget(
      {super.key,
      required this.widthk,
      required this.heightk,
      required this.index});

  final double? widthk;
  final double? heightk;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 50,
            ),
            Container(
              width: widthk,
              height: heightk,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w1280/31GlRQMiDunO8cl3NxTz34U64rf.jpg"),
                ),
                borderRadius: kBorderradius,
              ),
            ),
            kWidth
          ],
        ),
        Positioned(
          left: 15,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 10,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 100,
                color: kWhiteColor,
                decoration: TextDecoration.none,
                // decorationColor: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
