import 'package:flutter/material.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/services/download_services.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

class FastLaughProvider extends ChangeNotifier {
  bool isLoading = true;
  List<MovieModel> videoLists = [];

  Future<void> getMovieData() async {
    isLoading = true;
    notifyListeners();
    videoLists = await DownloadServices.instance.fetchImages();
    isLoading = false;
    notifyListeners();
    // print(videoLists.toString());
  }
}
