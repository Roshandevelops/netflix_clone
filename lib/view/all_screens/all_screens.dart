import 'package:flutter/material.dart';
import 'package:netflix_project/view/downloads/download_screen.dart';
import 'package:netflix_project/view/fast_laughs/fastlaughs_screen.dart';
import 'package:netflix_project/view/home/home_screen.dart';
import 'package:netflix_project/view/new_hot/new_hot_screen.dart';
import 'package:netflix_project/view/search/search_screen.dart';
import 'package:netflix_project/widgets/bottom_navbar.dart';

class AllScreens extends StatelessWidget {
  const AllScreens({super.key});

  final List screens = const [
    HomeScreen(),
    NewHotScreen(),
    FastLaughScreen(),
    SearchScreen(),
    DownloadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, index, child) {
          return screens[index];
        },
      ),
      bottomNavigationBar: BottomNavbarWidget(),
    );
  }
}
