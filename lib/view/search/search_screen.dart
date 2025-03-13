import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/controller/search_provider.dart';
import 'package:netflix_project/view/search/widgets/search_idle_widget.dart';
import 'package:netflix_project/view/search/widgets/search_result_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  Provider.of<SearchProvider>(context, listen: false)
                      .fetchSearchData();
                  log(value);
                },
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                backgroundColor: const Color(0x1FE5E1E1),
                style: const TextStyle(color: Colors.white60),
              ),
              kHeight,
              const Expanded(child: SearchIdleWidget()),
              // const Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
