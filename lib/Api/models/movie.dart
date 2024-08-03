import 'dart:convert';

import 'package:api_search_func/Api/apiKey.dart';
import 'package:http/http.dart' as http;

class Movie {
  String title, overview, thumbnail;

  Movie({
    required this.title, required this.overview, required this.thumbnail,
  });

  static Future<List<Movie>> dataMovie() async {

    Uri url = Uri.parse('https://api.themoviedb.org/3/discover/movie?${Apikey.apiKey}&page=${Apikey.page}');

    var responseAPI = await http.get(url);
    var data = (json.decode(responseAPI.body)) ['results'] as List;

    return data.map((data)=> Movie(
        title: data['title'],
        overview: data['overview'],
        thumbnail: data['poster_path'],
    )).toList();
  }
}
