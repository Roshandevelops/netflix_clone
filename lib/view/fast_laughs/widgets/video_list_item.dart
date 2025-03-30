import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_project/controller/fast_laugh_provider.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/view/fast_laughs/widgets/video_action_widget.dart';
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

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieModel.posterPath;

    final videourl = dummyVideoUrls[index % dummyVideoUrls.length];

    return Stack(
      children: [
        FastLaughVideoPlayerWidget(
          videoUrl: videourl,
          onStateChanged: (bool) {},
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                          radius: 35,
                          backgroundImage: posterPath == null
                              ? null
                              : NetworkImage("$imageAppendUrl$posterPath")),
                    ),
                    const VideoActionWidget(
                        iconData: Icons.emoji_emotions, title: "LOL"),
                    const VideoActionWidget(
                        iconData: Icons.add, title: "My List"),
                    GestureDetector(
                      onTap: () {
                        final newPosterPath =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieModel
                                .posterPath;

                        log(newPosterPath.toString());
                        if (newPosterPath != null) {
                          Share.share(newPosterPath);
                        }
                      },
                      child: const VideoActionWidget(
                          iconData: Icons.share, title: "Share"),
                    ),
                    const VideoActionWidget(
                        iconData: Icons.play_arrow, title: "Play"),
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

class FastLaughVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayerWidget({
    super.key,
    required this.videoUrl,
    required this.onStateChanged,
  });

  @override
  State<FastLaughVideoPlayerWidget> createState() =>
      _FastLaughVideoPlayerWidgetState();
}

class _FastLaughVideoPlayerWidgetState
    extends State<FastLaughVideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    videoPlayerController.initialize().then(
      (value) {
        setState(() {});
        videoPlayerController.play();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            )

          //  VideoPlayer(videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
