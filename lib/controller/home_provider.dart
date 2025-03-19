import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:netflix_project/services/new_and_hot_services.dart';

class HomeProvider extends ChangeNotifier {
  List<MovieModel> pastYearList = [];
  List<MovieModel> trendingList = [];
  List<MovieModel> tenseDramasList = [];
  List<MovieModel> southIndianList = [];
  List<MovieModel> topTenList = [];

  bool isLoading = true;

  Future<void> getHomeScreenData() async {
    log(topTenList.length.toString());

    log("home provider");
    isLoading = true;
    notifyListeners();
    pastYearList = await NewAndHotServices.instance.fetchNewAndHotMovie();
    isLoading = false;
    notifyListeners();

    isLoading = true;
    notifyListeners();
    trendingList = await NewAndHotServices.instance.fetchNewAndHotMovie();
    isLoading = false;
    notifyListeners();

    isLoading = true;
    notifyListeners();
    tenseDramasList = await NewAndHotServices.instance.fetchNewAndHotMovie();
    isLoading = false;
    notifyListeners();

    isLoading = true;
    notifyListeners();
    southIndianList = await NewAndHotServices.instance.fetchNewAndHotMovie();
    isLoading = false;
    notifyListeners();

    isLoading = true;
    notifyListeners();
    topTenList = await NewAndHotServices.instance.fetchNewAndHotTv();
    isLoading = false;
    notifyListeners();
  }
}
