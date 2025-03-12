import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class TopSearchesTileWidget extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TopSearchesTileWidget({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl,
              ),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: kWhiteColor,
          child: CircleAvatar(
            radius: 18,
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
