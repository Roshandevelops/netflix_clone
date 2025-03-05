import 'package:flutter/material.dart';
import 'package:netflix_project/view/fast_laughs/widgets/video_list_item.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            10,
            (value) {
              return VideoListItem(
                index: value,
              );
            },
          ),
        ),
      ),
    );
  }
}
