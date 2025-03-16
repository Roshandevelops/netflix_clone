import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class StackImageIconWidget extends StatelessWidget {
  const StackImageIconWidget({
    super.key,
    required this.posterPath,
  });

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(fit: BoxFit.cover, posterPath
              // newAndHotTempImage,
              ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 25,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                size: 30,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
