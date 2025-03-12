import 'package:netflix_project/core/strings.dart';

class ApiEndPoints {
  static const trendingAll = '$kBaseUrl/trending/all/day?language=en-US';
  static const topSearches =
      "$kBaseUrl/search/movie?query=spiderman&include_adult=false&language=en-US&page=1";
}
