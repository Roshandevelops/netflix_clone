import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_project/controller/hot_and_new_provider.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/view/new_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:provider/provider.dart';

class NewHotScreen extends StatefulWidget {
  const NewHotScreen({super.key});

  @override
  State<NewHotScreen> createState() => _NewHotScreenState();
}

class _NewHotScreenState extends State<NewHotScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await Provider.of<NewAndHotProvider>(context, listen: false)
            .fetchNewAndHotData();
      } catch (e) {
        log("error checking:$e".toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: kWhiteColor,
              ),
              kWidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.amber,
              ),
              kWidth
            ],
            bottom: TabBar(
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(30),
              ),
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "Coming Soon",
                ),
                Tab(
                  text: "Everyones's Watching",
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            BuildComingSoon(),
            BuildEveryOneWatching(),
          ],
        ),
      ),
    );
  }
}

class BuildComingSoon extends StatelessWidget {
  const BuildComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewAndHotProvider>(
        builder: (context, movieProvider, child) {
      if (movieProvider.comingSoonList.isEmpty) {
        return const Center(child: Text("Empty List"));
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
            String newHotUrl = movie.posterPath != null
                ? "$imageAppendUrl${movie.posterPath}"
                : "https://image.tmdb.org/t/p/w500/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg";

            return ComingSoonWidget(
              movieName: movie.originalTitle ?? "No title",
              day: "11",
              description: movie.overView ?? "No description",
              id: movie.id.toString(),
              month: "Feb",
              posterPath: newHotUrl,
            );
          },
          itemCount: movieProvider.comingSoonList.length,
        );
      }
    });
  }
}

class BuildEveryOneWatching extends StatelessWidget {
  const BuildEveryOneWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return const SizedBox();
        // EveryonesWatchingWidget();
      },
      itemCount: 5,
    );
  }
}
