import 'package:flutter/material.dart';

import '../models/movie.dart';

class WatchListMovieProvider with ChangeNotifier {
  final List<Movie> _movies = [];

  List<Movie> get watchListMovie => _movies;


  void saveMovie(Movie movie) {
    _movies.insert(0, movie);
    notifyListeners();
  }

  void deleteMovie(Movie movie) {
    _movies.remove(movie);
    notifyListeners();
  }


}