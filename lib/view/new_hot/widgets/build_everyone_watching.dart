import 'package:flutter/material.dart';
import 'package:netflix_project/controller/new_and_hot_provider.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/view/new_hot/widgets/everyone_widget.dart';
import 'package:provider/provider.dart';

class BuildEveryOneWatching extends StatelessWidget {
  const BuildEveryOneWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<NewAndHotProvider>(context, listen: false)
            .fetchNewAndHotData();
      },
      child: Consumer<NewAndHotProvider>(builder: (context, tvProvider, child) {
        if (tvProvider.comingSoonList.isEmpty) {
          return const Center(child: Text("Empty List"));
        } else if (tvProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (ctx, index) {
              final tv = tvProvider.everyOneIsWatchingList[index];

              String newHotTvUrl = tv.posterPath != null
                  ? "$imageAppendUrl${tv.posterPath}"
                  : "https://image.tmdb.org/t/p/w500/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg";
              return EveryonesWatchingWidget(
                movieName: tv.name ?? "No Name provided",
                posterPath: newHotTvUrl,
                description: tv.overView ?? "No description",
              );
            },
            itemCount: tvProvider.everyOneIsWatchingList.length,
          );
        }
      }),
    );
  }
}
