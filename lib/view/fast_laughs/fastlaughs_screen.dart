import 'package:flutter/material.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("fast laughs"),
      )),
    );
  }
}
