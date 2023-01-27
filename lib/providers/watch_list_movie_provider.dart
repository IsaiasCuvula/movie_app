import 'package:flutter/material.dart';

import '../models/movie.dart';

class WatchListMovieProvider with ChangeNotifier {
  final List<Movie> _movies = [];

  //bool isFavorite = false;

  List<Movie> get watchListMovie => _movies;

  bool isFavorite(Movie movie) {
    if (_movies.contains(movie)) {
      return true;
    }
    return false;
  }

  void saveMovieToFavorite(Movie movie) {
    if (!_movies.contains(movie)) {
      _movies.insert(0, movie);
    }
    notifyListeners();
  }

  void removeMovieFromFavorite(Movie movie) {
    _movies.remove(movie);
    notifyListeners();
  }
}
