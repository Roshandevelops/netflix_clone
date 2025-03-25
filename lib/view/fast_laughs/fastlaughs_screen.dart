import 'package:flutter/material.dart';
import 'package:netflix_project/controller/fast_laugh_provider.dart';
import 'package:netflix_project/view/fast_laughs/widgets/video_list_item.dart';
import 'package:provider/provider.dart';

class FastLaughScreen extends StatefulWidget {
  const FastLaughScreen({super.key});

  @override
  State<FastLaughScreen> createState() => _FastLaughScreenState();
}

class _FastLaughScreenState extends State<FastLaughScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<FastLaughProvider>(context, listen: false)
          .getMovieData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<FastLaughProvider>(
            builder: (context, fastLaughProvider, child) {
          if (fastLaughProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (fastLaughProvider.videoLists.isEmpty) {
            return Center(
              child: Text("Empty List"),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                10,
                (value) {
                  return VideoListItem(
                    index: value,
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
