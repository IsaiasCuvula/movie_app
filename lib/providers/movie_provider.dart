import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/helpers.dart';

class MovieProvider with ChangeNotifier {
  bool isLoading = false;
  final List<Movie> _movies = [];
  final List<Movie> _mostRatedMovies = [];

  List<Movie> get movies => _movies;

  List<Movie> get mostRatedMovies => _mostRatedMovies;

  void _getMostRatedMovies() {
    _mostRatedMovies.clear();
    for (Movie movie in _movies) {
      final double movieRating = Helper.calculateAverageRatings(movie);
      if (movieRating >= 6) {
        _mostRatedMovies.insert(0, movie);
      }
    }
  }

  Future<void> fetchMovies(int pageNumber) async {
    final Uri movieUri = Uri.parse(kApiUrl);
    try {
      isLoading = true;
      final http.Response responseData = await http.get(movieUri);
      final moviesResponse = jsonDecode(responseData.body);

      final totalMoviesToFetch = pageNumber * 10;

      _movies.clear();
      for (int i = 0; i < totalMoviesToFetch; i++) {
        final Movie movie = Movie.fromJson(moviesResponse[i]);
        _movies.add(movie);
      }
      isLoading = false;
    } on HttpException catch (e) {
      debugPrint('Fetching data error: ${e.message}');
      isLoading = false;
      throw Exception('Failed to load movies');
    }
    _getMostRatedMovies();
    notifyListeners();
  }
}
