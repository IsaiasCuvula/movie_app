import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/utils/constants.dart';

class MovieProvider with ChangeNotifier {
  bool isLoading = false;
  final List<Movie> _movies = [];
  final List<Movie> _randomMovies = [];

  List<Movie> get movies => _movies;

  List<Movie> get randomMovies => _randomMovies;

  void getRandomMovies() {
    _randomMovies.clear();
    for (int i = 1; i <= 3; i++) {
      final int randomIndex = Random().nextInt(_movies.length);
      _randomMovies.add(_movies[randomIndex]);
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
    getRandomMovies();
    notifyListeners();
  }
}
