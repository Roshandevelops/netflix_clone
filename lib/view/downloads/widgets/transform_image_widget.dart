import 'dart:math';

import 'package:flutter/material.dart';

class TransformImageWidget extends StatelessWidget {
  const TransformImageWidget({
    super.key,
    required this.imageList,
    this.angleRotation = 0,
    required this.margin,
    required this.containerSize,
    this.borderRadius = 10,
  });

  final String imageList;
  final double angleRotation;
  final EdgeInsets margin;

  final Size containerSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angleRotation * pi / 180,
      child: Container(
        margin: margin,
        width: containerSize.width,
        height: containerSize.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
