import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget(
      {super.key,
      required this.widthk,
      required this.heightk,
      required this.index,
      required this.numberCardUrl});

  final double? widthk;
  final double? heightk;
  final int index;

  final String numberCardUrl;

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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(numberCardUrl),
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
