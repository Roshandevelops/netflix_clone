import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:netflix_project/core/api_end_points.dart';
import 'package:netflix_project/models/download_model.dart';

class DownloadServices {
  DownloadServices.internal();
  static DownloadServices instance = DownloadServices.internal();
  factory DownloadServices() {
    return DownloadServices.instance;
  }

  Future<List<DownloadModel>> fetchImages() async {
    final response = await http.get(
      Uri.parse(
        ApiEndPoints.trendingAll,
      ),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDRmNjVmMDI2YTA4NDEwNGZlNjIyZTNkYTU3M2Q4ZCIsIm5iZiI6MTc0MDg5OTg1OC4yNTUsInN1YiI6IjY3YzQwNjEyNjQ2NmJkOGVkMjRlMTZmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C33USMZlPNV96p8JRgVOs3YPPm7ucEz3Lb28vkjZqx0",
        "accept": "application/json"
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;

      final result = (json["results"] as List).map(
        (e) {
          // log(e["poster_path"]);
          return DownloadModel.fromJson(e);
        },
      ).toList();

      log(result.toString());

      return result;
    } else {
      return [];
    }
  }
}
