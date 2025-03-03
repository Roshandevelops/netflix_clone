import 'dart:math';

import 'package:flutter/material.dart';

class TransformImageWidget extends StatelessWidget {
  const TransformImageWidget({
    super.key,
    required this.imageList,
    this.angleRotation = 0,
    required this.margin,
  });

  final String imageList;
  final double angleRotation;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angleRotation * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
