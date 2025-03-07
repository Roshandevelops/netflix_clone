import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/view/search/widgets/search_idle_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class TopSearchesTileWidget extends StatelessWidget {
  const TopSearchesTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                verticalImageUrl[0],
              ),
            ),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            "Movie name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          radius: 25,
          backgroundColor: kWhiteColor,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: kBlackColor,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
