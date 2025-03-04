import 'package:flutter/material.dart';

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextStyle(fontSize: 20),
    );
  }
}
