import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/view/search/widgets/search_result_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                backgroundColor: Color(0x1FE5E1E1),
                style: TextStyle(color: Colors.white60),
              ),
              kHeight,
              // Expanded(child: SearchIdleWidget()),
              Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
