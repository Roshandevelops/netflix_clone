import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_project/controller/new_and_hot_provider.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/view/new_hot/widgets/coming_soon_widget.dart';
import 'package:provider/provider.dart';

class BuildComingSoon extends StatelessWidget {
  const BuildComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<NewAndHotProvider>(context, listen: false)
            .fetchNewAndHotData();
      },
      child:
          Consumer<NewAndHotProvider>(builder: (context, movieProvider, child) {
        if (movieProvider.comingSoonList.isEmpty) {
          return const Center(
            child: Text("Empty List"),
          );
        } else if (movieProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final movie = movieProvider.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              String newHotMovieUrl = movie.posterPath != null
                  ? "$imageAppendUrl${movie.posterPath}"
                  : "https://image.tmdb.org/t/p/w500/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg";

              String month = "";
              String day = "";

              try {
                final date = DateTime.tryParse(movie.releaseDate!);
                final formattedDate = DateFormat.yMMMMd("en_US").format(date!);

                month = formattedDate
                    .split(" ")
                    .first
                    .substring(0, 3)
                    .toUpperCase();
                day = movie.releaseDate!.split("-")[1];
              } catch (e) {
                month = "";
                day = "";
              }
              {}

              return ComingSoonWidget(
                movieName: movie.title ?? "No title",
                day: day,
                description: movie.overView ?? "No description",
                id: movie.id.toString(),
                month: month,
                posterPath: newHotMovieUrl,
              );
            },
            itemCount: movieProvider.comingSoonList.length,
          );
        }
      }),
    );
  }
}
