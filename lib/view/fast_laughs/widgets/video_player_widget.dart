import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FastLaughVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  final bool isMuted;
  final bool isPlaying;
  const FastLaughVideoPlayerWidget({
    super.key,
    required this.videoUrl,
    required this.onStateChanged,
    this.isMuted = false,
    this.isPlaying = true,
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
      (_) {
        setState(() {});

        if (widget.isMuted) {
          videoPlayerController.setVolume(0);
        }
        if (widget.isPlaying) {
          videoPlayerController.play();
        } else {
          videoPlayerController.pause();
        }
        widget.onStateChanged(videoPlayerController.value.isPlaying);
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
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        videoPlayerController.play();
      } else {
        videoPlayerController.pause();
      }
      widget.onStateChanged(widget.isPlaying);
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
