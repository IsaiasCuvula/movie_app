import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/utils/constants.dart';

class MovieProvider with ChangeNotifier {

  bool isLoading = false;
  final List<Movie> _movies = [];
  List<Movie> get movies => _movies;


  Future<void> fetchMovies() async {
    final Uri movieUri = Uri.parse(kApiUrl);
    try{
      isLoading = true;
      final moviesResponse = await http.get(movieUri);
      //final data = Movie.fromJson(jsonDecode(moviesResponse.body));

      print("my: ${moviesResponse.body}");

      isLoading = false;
      notifyListeners();
    } on HttpException catch (e){
      debugPrint('Fetching data error: ${e.message}');
      isLoading = false;
      throw Exception('Failed to load movies');
    }
  }
}