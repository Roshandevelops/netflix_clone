import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavbarWidget extends StatelessWidget {
  final ValueNotifier<int> indexChangeNotifier;
  const BottomNavbarWidget({super.key, required this.indexChangeNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, newIndex, child) {
          return BottomNavigationBar(
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.collections,
                ),
                label: "New & Hot",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_emotions,
                ),
                label: "Fast Laughs",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.download,
                ),
                label: "Download",
              ),
            ],
          );
          // CurvedNavigationBar(
          //   onTap: (index) {
          //     indexChangeNotifier.value = index;
          //   },
          //   index: newIndex,
          //   animationDuration: const Duration(milliseconds: 300),
          //   // color: Colors.black,
          //   backgroundColor: Colors.black,
          //   items: const [
          //     Icon(Icons.home),
          //     Icon(Icons.collections),
          //     Icon(Icons.emoji_emotions),
          //     Icon(Icons.search),
          //     Icon(Icons.download)
          //   ],
          // );
        });
  }
}
