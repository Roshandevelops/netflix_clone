import 'package:flutter/material.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/view/fast_laughs/widgets/video_action_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final MovieModel movieModel;

  const VideoListItemInheritedWidget({
    Key? key,

    // super.key,
    required this.widget,
    required this.movieModel,
  }) : super(
          key: key,
          child: widget,
        );

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieModel != movieModel;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    super.key,
    required this.index,
  });

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
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                //right side
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
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
