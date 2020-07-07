import 'dart:convert';

import 'package:wed_assignment/core/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:wed_assignment/core/models/artist_work.dart';

class SearchService {
  static const API = "https://itunes.apple.com/search?term=";

  //get artists work through artist's name
  Future<ApiResponse<List<ArtistWork>>> getWorksList(String name) {
    String processedName = name.replaceAll(" ", "+");
    print(API + '$processedName');
    return http.get(API + '$processedName').then((data) {
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        final works = <ArtistWork>[];
        for (var item in jsonData["results"]) {
          final work = ArtistWork.fromJson(item);
          works.add(work);
        }
        return ApiResponse<List<ArtistWork>>(data: works);
      }
      return ApiResponse<List<ArtistWork>>(
          error: true,
          errorMessage:
              "fetching api status code ${data.statusCode} error occured");
    }).catchError((_) => ApiResponse<List<ArtistWork>>(
        error: true, errorMessage: " http error occured"));
  }
}
