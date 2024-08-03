import 'dart:convert';

import 'package:api_search_func/Api/apiKey.dart';
import 'package:http/http.dart' as http;

class SearchMovie {
  String title, overview, thumbnail;

  SearchMovie({
    required this.title,
    required this.overview,
    required this.thumbnail,
  });

  static Future<List<SearchMovie>> dataMovie() async {
    List<SearchMovie> allMovies = [];

    for (int page = 1; page <= 10; page++) {
      Uri url = Uri.parse('https://api.themoviedb.org/3/discover/movie?${Apikey.apiKey}&page=$page');
      var responseAPI = await http.get(url);

      if (responseAPI.statusCode == 200) {
        var data = json.decode(responseAPI.body)['results'] as List;
        var movies = data.map((movieData) => SearchMovie(
          title: movieData['title'],
          overview: movieData['overview'],
          thumbnail: movieData['poster_path'],
        )).toList();

        allMovies+=(movies);
      } else {
        print('Failed to load page $page');
        break;
      }
    }

    return allMovies;
  }
}
