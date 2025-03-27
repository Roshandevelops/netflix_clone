import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';

class StackImageIconWidget extends StatelessWidget {
  const StackImageIconWidget({
    super.key,
    this.posterPath,
  });

  final String? posterPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            fit: BoxFit.cover,
            posterPath!,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.signal_wifi_connected_no_internet_4_rounded),
              );
            },
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
