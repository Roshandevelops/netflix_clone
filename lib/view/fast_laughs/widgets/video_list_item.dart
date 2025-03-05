import 'package:flutter/material.dart';
import 'package:netflix_project/view/fast_laughs/widgets/video_action_widget.dart';
import 'package:netflix_project/view/search/widgets/search_result_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off,
                      size: 30,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            "https://media.themoviedb.org/t/p/w500_and_h282_face/kYgQzzjNis5jJalYtIHgrom0gOx.jpg"),
                      ),
                    ),
                    VideoActionWidget(
                        iconData: Icons.emoji_emotions, title: "LOL"),
                    VideoActionWidget(iconData: Icons.add, title: "My List"),
                    VideoActionWidget(iconData: Icons.share, title: "Share"),
                    VideoActionWidget(iconData: Icons.play_arrow, title: "LOL"),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
