import 'package:flutter/material.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/services/search_services.dart';

class SearchProvider extends ChangeNotifier {
  bool isLoading = true;
  List<MovieModel> topResultData = [];
  Future<void> fetchSearchData(String value) async {
    isLoading = true;
    notifyListeners();
    topResultData =
        await SearchServices.instance.fetchTopSearchIdleData(query: value);
    // print(topResultData.toString());
    // topResultData = fetchedItems;
    isLoading = false;
    notifyListeners();
  }
}
