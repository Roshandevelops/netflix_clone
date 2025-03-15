import 'package:flutter/material.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/services/download_services.dart';

class DownloadProvider extends ChangeNotifier {
  bool isLoading = true;

  List<MovieModel> fetchedItems = [];
  Future<void> getData() async {
    if (fetchedItems.isNotEmpty) {
      fetchedItems;
      return;
    }
    isLoading = true;
    notifyListeners();
    fetchedItems = await DownloadServices.instance.fetchImages();
    // newFetchedItems = fetchedItems;
    isLoading = false;

    notifyListeners();
  }
}
