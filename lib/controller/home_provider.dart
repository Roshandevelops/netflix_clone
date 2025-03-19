import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_project/models/new_hot_model.dart';
import 'package:netflix_project/services/new_and_hot_services.dart';

class HomeProvider extends ChangeNotifier {
  List<NewAndHotModel> pastYearList = [];
  List<NewAndHotModel> trendingList = [];
  List<NewAndHotModel> tenseDramasList = [];
  List<NewAndHotModel> southIndianList = [];
  List<NewAndHotModel> topTenList = [];

  bool isLoading = true;

  Future<void> getHomeScreenData() async {
    log(topTenList.length.toString());
    // if (pastYearList.isNotEmpty) {
    //   pastYearList;
    //   return;
    // }
    // if (trendingList.isNotEmpty) {
    //   trendingList;
    //   return;
    // }
    // if (tenseDramasList.isNotEmpty) {
    //   tenseDramasList;
    //   return;
    // }
    // if (southIndianList.isNotEmpty) {
    //   southIndianList;
    //   return;
    // }
    // if (topTenList.isNotEmpty) {
    //   topTenList;
    //   return;
    // }

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
