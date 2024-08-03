import 'package:api_search_func/pages/movie_list.dart';
import 'package:api_search_func/pages/noData.dart';
import 'package:api_search_func/pages/save_movie.dart';
import 'package:flutter/cupertino.dart';

class MovieIsclicked with ChangeNotifier {
  final List<Widget> _movie_widget = [
    MovieList(),
    SaveMovie(),
    NoData(),
  ];
  int _currentIndex = 0;

  List<Widget> get movie_widget => _movie_widget;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}