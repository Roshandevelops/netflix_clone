import 'package:flutter/material.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/services/search_services.dart';

class SearchProvider extends ChangeNotifier {
  bool isLoading = true;
  List<MovieModel> topResultData = [];
  Future<void> fetchSearchData(String value) async {
    isLoading = true;
    notifyListeners();
    final fetchedItems =
        await SearchServices.instance.fetchTopSearchIdleData(value);
    topResultData = fetchedItems;
    isLoading = false;
    notifyListeners();
  }
}
