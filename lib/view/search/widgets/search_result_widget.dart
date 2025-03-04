import 'package:flutter/cupertino.dart';
import 'package:netflix_project/view/search/widgets/movies_tv_tile_widget.dart';
import 'package:netflix_project/view/search/widgets/title.dart';
import 'package:netflix_project/widgets/constants.dart';

const dummyImageUrl =
    "https://image.tmdb.org/t/p/w1280/31GlRQMiDunO8cl3NxTz34U64rf.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(heading: "Movies & TV"),
        kHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              20,
              (index) {
                return MoviesTvCardWidget();
              },
            ),
          ),
        ),
      ],
    );
  }
}
