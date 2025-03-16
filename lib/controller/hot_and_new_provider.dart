import 'package:flutter/material.dart';
import 'package:netflix_project/models/new_hot_model.dart';
import 'package:netflix_project/services/new_and_hot_services.dart';

class NewAndHotProvider extends ChangeNotifier {
  bool isLoading = true;
  List<NewAndHotModel> comingSoonList = [];
  // List<NewAndHotModel> everyOneIsWatchingList = [];
  Future<void> fetchNewAndHotData() async {
    isLoading = true;
    notifyListeners();
    comingSoonList = await NewAndHotServices.instance.fetchNewAndHotMovie();
    isLoading = false;
    notifyListeners();
    // log("checking${comingSoonList.toString()}");

    // everyOneIsWatchingList =
    //     await NewAndHotServices.instance.fetchNewAndHotTv();
    // log("Thankappan${everyOneIsWatchingList.toString()}");
    // notifyListeners();
  }
}
