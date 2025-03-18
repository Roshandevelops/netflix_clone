import 'dart:convert';
import 'dart:developer';
import 'package:netflix_project/core/api_end_points.dart';
import 'package:netflix_project/core/strings.dart';
import 'package:netflix_project/models/movie_model.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  SearchServices.internal();
  static SearchServices instance = SearchServices.internal();
  factory SearchServices() {
    return SearchServices.instance;
  }

  Future<List<MovieModel>> fetchTopSearchIdleData(
      {required String query}) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$kBaseUrl/search/movie?query=$query&include_adult=false&language=en-US&page=1',
        ),
        headers: {
          "Authorization": ApiEndPoints.apiAccessToken,
          "accept": "application/json",
        },
      );
      if (response.statusCode == 200) {
        // log(response.body.toString());
        final json = jsonDecode(response.body) as Map;
        final result = (json["results"] as List).map(
          (e) {
            log(e["poster_path"].toString());
            return MovieModel.fromJson(e);
          },
        ).toList();
        log(result.toString());
        return result;
      } else {
        return [];
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
