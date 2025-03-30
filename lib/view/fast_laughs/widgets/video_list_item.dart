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

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieModel.posterPath;

    final videourl = dummyVideoUrls[widget.index % dummyVideoUrls.length];
    bool isLol = isLolMap[widget.index] ?? true;
    bool isMuted = isMutedMap[widget.index] ?? false;

    return Stack(
      children: [
        FastLaughVideoPlayerWidget(
          videoUrl: videourl,
          onStateChanged: (bool) {},
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
                    const VideoActionWidget(
                        iconData: Icons.add, title: "My List"),
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
  final bool isMuted;
  const FastLaughVideoPlayerWidget({
    super.key,
    required this.videoUrl,
    required this.onStateChanged,
    this.isMuted = false,
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
        if (widget.isMuted) {
          videoPlayerController.setVolume(0);
        }
      },
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant FastLaughVideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isMuted != widget.isMuted) {
      videoPlayerController.setVolume(widget.isMuted ? 0 : 1);
    }
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
