import 'package:flutter/material.dart';
import 'package:netflix_project/models/download_model.dart';
import 'package:netflix_project/services/download_services.dart';

class DownloadProvider extends ChangeNotifier {
  bool isLoading = true;

  List<DownloadModel> newFetchedItems = [];
  Future<void> getData() async {
    if (newFetchedItems.isNotEmpty) {
      newFetchedItems;
      return;
    }
    isLoading = true;
    notifyListeners();
    final fetchedItems = await DownloadServices.instance.fetchImages();
    newFetchedItems = fetchedItems;
    isLoading = false;

    notifyListeners();
  }
}
