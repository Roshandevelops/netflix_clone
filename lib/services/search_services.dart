import 'dart:convert';
import 'dart:developer';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  SearchServices.internal();
  static SearchServices instance = SearchServices.internal();
  factory SearchServices() {
    return SearchServices.instance;
  }

  Future<List<MovieModel>> fetchTopSearchIdleData(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$kBaseUrl/search/movie?query=$query&include_adult=false&language=en-US&page=1',
        ),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDRmNjVmMDI2YTA4NDEwNGZlNjIyZTNkYTU3M2Q4ZCIsIm5iZiI6MTc0MDg5OTg1OC4yNTUsInN1YiI6IjY3YzQwNjEyNjQ2NmJkOGVkMjRlMTZmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C33USMZlPNV96p8JRgVOs3YPPm7ucEz3Lb28vkjZqx0",
          "accept": "application/json",
        },
      );
      if (response.statusCode == 200) {
        // log(response.body.toString());
        final json = jsonDecode(response.body) as Map;
        final result = (json["results"] as List).map(
          (e) {
            // log(e["poster_path"].toString());
            return MovieModel.fromJson(e);
          },
        ).toList();
        log(result.toString());
        return result;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
