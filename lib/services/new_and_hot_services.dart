import 'dart:convert';
import 'dart:developer';

import 'package:netflix_project/core/api_end_points.dart';
import 'package:netflix_project/models/new_hot_model.dart';
import 'package:http/http.dart' as http;

class NewAndHotServices {
  NewAndHotServices.internal();
  static NewAndHotServices instance = NewAndHotServices.internal();
  factory NewAndHotServices() {
    return NewAndHotServices.instance;
  }

  Future<List<NewAndHotModel>> fetchNewAndHotMovie() async {
    try {
      final response = await http.get(
        Uri.parse(
          ApiEndPoints.hotAndNewMovie,
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
            // log(e.toString());
            log(e["poster_path"].toString());
            return NewAndHotModel.fromJson(e);
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

  Future<List<NewAndHotModel>> fetchNewAndHotTv() async {
    try {
      final response = await http.get(
        Uri.parse(
          ApiEndPoints.hotAndNewTv,
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
            // log(e["poster_path"].toString());
            return NewAndHotModel.fromJson(e);
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
