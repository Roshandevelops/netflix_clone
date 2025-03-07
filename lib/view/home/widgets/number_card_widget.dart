import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({
    super.key,
    required this.widthk,
    required this.heightk,
    required this.index,
  });

  final double? widthk;
  final double? heightk;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 200,
              width: 50,
            ),
            Container(
              width: widthk,
              height: heightk,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: const DecorationImage(
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
          left: 0,
          bottom: -40,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: Colors.grey,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: kBlackColor,
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
