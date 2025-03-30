import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_project/controller/fast_laugh_provider.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/view/fast_laughs/widgets/video_action_widget.dart';
import 'package:netflix_project/view/fast_laughs/widgets/video_player_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

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

class VideoListItem extends StatefulWidget {
  const VideoListItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  static Map<int, bool> isLolMap = {};
  static Map<int, bool> isMutedMap = {};
  static Map<int, bool> isPlayingMap = {};
  static Map<int, bool> isMyListMap = {};

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieModel.posterPath;

    final videourl = dummyVideoUrls[widget.index % dummyVideoUrls.length];
    bool isLol = isLolMap[widget.index] ?? true;
    bool isMuted = isMutedMap[widget.index] ?? false;
    bool isPlaying = isPlayingMap[widget.index] ?? true;
    bool isInMyList = isMyListMap[widget.index] ?? false;

    return Stack(
      children: [
        FastLaughVideoPlayerWidget(
          videoUrl: videourl,
          onStateChanged: (bool isPlaying) {
            setState(() {
              isPlayingMap[widget.index] = isPlaying;
            });
          },
          isMuted: isMuted,
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
                    onPressed: () {
                      setState(() {
                        isMuted = !isMuted;
                        isMutedMap[widget.index] = isMuted;
                      });
                    },
                    icon: Icon(
                      isMuted ? Icons.volume_off : Icons.volume_up_outlined,
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
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage("$imageAppendUrl$posterPath"),
                      ),
                    ),
                    VideoActionWidget(
                      iconData: isLol ? Icons.emoji_emotions : Icons.favorite,
                      title: isLol ? "Lol" : "Liked",
                      onPressed: () {
                        setState(() {
                          isLol = !isLol;
                          isLolMap[widget.index] = isLol;
                        });
                      },
                    ),
                    VideoActionWidget(
                      iconData: isInMyList ? Icons.check : Icons.add,
                      title: isInMyList ? "My List" : "Add",
                      onPressed: () {
                        setState(() {
                          isInMyList = !isInMyList;
                          isMyListMap[widget.index] = isInMyList;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        final _posterPath =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieModel
                                .posterPath;
                        log(_posterPath.toString());
                        if (_posterPath != null) {
                          Share.share(_posterPath);
                        }
                      },
                      child: const VideoActionWidget(
                          iconData: Icons.share, title: "Share"),
                    ),
                    VideoActionWidget(
                      iconData: isPlaying ? Icons.play_arrow : Icons.pause,
                      title: isPlaying ? "Pause" : "Play",
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                          isPlayingMap[widget.index] = isPlaying;
                        });
                      },
                    ),
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
