import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_project/controller/search_provider.dart';
import 'package:netflix_project/view/search/widgets/search_idle_widget.dart';
import 'package:netflix_project/view/search/widgets/search_result_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false)
          .fetchSearchData("spiderman");
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
                controller: searchController,
                onChanged: (value) async {
                  if (value == '') {
                    await Provider.of<SearchProvider>(context, listen: false)
                        .fetchSearchData("spiderman");
                  } else {
                    await Provider.of<SearchProvider>(context, listen: false)
                        .fetchSearchData(value);
                  }

                  setState(() {});
                  // log(result.toString());
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
              if (searchController.text.isEmpty)
                const Expanded(child: SearchIdleWidget())
              else
                const Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
