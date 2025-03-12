import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/controller/search_provider.dart';
import 'package:netflix_project/view/search/widgets/search_idle_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false).fetchSearchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<SearchProvider>(context, listen: false).fetchSearchData();
    // });
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
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
              Expanded(child: SearchIdleWidget()),
              // Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
