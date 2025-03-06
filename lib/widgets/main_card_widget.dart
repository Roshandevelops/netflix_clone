import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({super.key, required this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://media.themoviedb.org/t/p/w500_and_h282_face/kYgQzzjNis5jJalYtIHgrom0gOx.jpg",
              ),
            ),
            borderRadius: kBorderradius,
          ),
        ),
        // kWidth,
        kHeight,
      ],
    );
  }
}
