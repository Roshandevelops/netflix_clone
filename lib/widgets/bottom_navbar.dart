import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, newIndex, child) {
          return CurvedNavigationBar(
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            index: newIndex,
            animationDuration: Duration(milliseconds: 300),
            // color: Colors.black,
            backgroundColor: Colors.black,
            items: const [
              Icon(Icons.home),
              Icon(Icons.collections),
              Icon(Icons.emoji_emotions),
              Icon(Icons.search),
              Icon(Icons.download)
            ],
          );
        });
  }
}
