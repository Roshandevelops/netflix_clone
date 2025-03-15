import 'package:flutter/material.dart';
import 'package:netflix_project/controller/search_provider.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/widgets/title_widget.dart';
import 'package:netflix_project/view/search/widgets/top_searches_tile_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:provider/provider.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          heading: "Top Searches",
        ),
        kHeight20,
        Expanded(
          child: Consumer<SearchProvider>(
            builder: (context, searchProviderValue, child) {
              if (searchProviderValue.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (searchProviderValue.topResultData.isEmpty) {
                return const Center(
                  child: Text("List is empty"),
                );
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = searchProviderValue.topResultData[index];

                    String imageUrl = movie.posterPath != null
                        ? "$imageAppendUrl${movie.posterPath}"
                        : "https://image.tmdb.org/t/p/w500/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg";

                    return TopSearchesTileWidget(
                      title: movie.title ?? "No tittle provided",
                      imageUrl: imageUrl,
                      // "$imageAppendUrl${movie.posterPath}",
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return kHeight20;
                  },
                  itemCount: searchProviderValue.topResultData.length,
                );
              }
            },
          ),
        )
      ],
    );
  }
}
