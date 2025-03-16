import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:netflix_project/core/api_end_points.dart';
import 'package:netflix_project/models/movie_model.dart';

class DownloadServices {
  DownloadServices.internal();
  static DownloadServices instance = DownloadServices.internal();
  factory DownloadServices() {
    return DownloadServices.instance;
  }

  Future<List<MovieModel>> fetchImages() async {
    try {
      final response = await http.get(
        Uri.parse(
          ApiEndPoints.trendingAll,
        ),
        headers: {
          "Authorization": ApiEndPoints.apiAccessToken,
          "accept": "application/json"
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map;

        final result = (json["results"] as List).map(
          (e) {
            log(e["poster_path"]);
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
