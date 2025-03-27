import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_project/controller/new_and_hot_provider.dart';
import 'package:netflix_project/view/new_hot/widgets/build_coming_soon.dart';
import 'package:netflix_project/view/new_hot/widgets/build_everyone_watching.dart';
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
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyones's Watching",
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
