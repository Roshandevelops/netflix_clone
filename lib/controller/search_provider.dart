import 'package:flutter/material.dart';
import 'package:netflix_project/models/search_model.dart';
import 'package:netflix_project/services/search_services.dart';

class SearchProvider extends ChangeNotifier {
  bool isLoading = true;
  List<SearchModel> topResultData = [];
  Future<void> fetchSearchData() async {
    isLoading = true;
    notifyListeners();
    final fetchedItems = await SearchServices.instance.fetchTopSearchIdleData();
    topResultData = fetchedItems;
    isLoading = false;
    notifyListeners();
  }
}
