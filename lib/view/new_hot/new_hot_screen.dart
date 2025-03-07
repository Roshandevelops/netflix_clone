import 'package:flutter/material.dart';
import 'package:netflix_project/view/new_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_project/view/new_hot/widgets/everyone_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({super.key});

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
        body: TabBarView(
          children: [
            _buildComingSoon(context),
            _buildEveroneWattching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return const ComingSoonWidget();
      },
      itemCount: 3,
    );
  }

  Widget _buildEveroneWattching() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return const EveryonesWatchingWidget();
      },
      itemCount: 3,
    );
  }
}
