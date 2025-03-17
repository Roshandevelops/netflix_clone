import 'package:netflix_project/core/strings.dart';

class ApiEndPoints {
  static const trendingAll = '$kBaseUrl/trending/all/day?language=en-US';
  static const hotAndNewMovie =
      "$kBaseUrl/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc";
  static const hotAndNewTv =
      "$kBaseUrl/discover/tv?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc";

  static const apiAccessToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDRmNjVmMDI2YTA4NDEwNGZlNjIyZTNkYTU3M2Q4ZCIsIm5iZiI6MTc0MDg5OTg1OC4yNTUsInN1YiI6IjY3YzQwNjEyNjQ2NmJkOGVkMjRlMTZmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C33USMZlPNV96p8JRgVOs3YPPm7ucEz3Lb28vkjZqx0";
}
