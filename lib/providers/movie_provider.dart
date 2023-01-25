import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/utils/constants.dart';

class MovieProvider with ChangeNotifier {
  bool isLoading = false;
  final List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> fetchMovies() async {
    final Uri movieUri = Uri.parse(kApiUrl);
    try {
      isLoading = true;
      final http.Response moviesResponse = await http.get(movieUri);
      final responseData = jsonDecode(moviesResponse.body);
      //final data = Movie.fromJson();

      //final movie = Movie.fromJson(jsonDecode(moviesResponse.body));

      for (int i = 0; i < 10; i++) {
        final Movie movie = Movie.fromJson(responseData[i]);
        _movies.add(movie);

        print("imdbRating: ${movie.imdbRating}");
        print(responseData.toString());
      }

      //print("my: ${movie}");

      //print("my: ${moviesResponse.body}");

      isLoading = false;
    } on HttpException catch (e) {
      debugPrint('Fetching data error: ${e.message}');
      isLoading = false;
      throw Exception('Failed to load movies');
    }
    notifyListeners();
  }
}
