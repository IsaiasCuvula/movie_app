import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/search_text_field.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';
import '../../utils/constants.dart';
import 'list_movies.dart';
import 'most_rated_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieProvider _movieProvider;
  late ScrollController _scrollController;
  int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _loadInitialMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _loadInitialMovies() async {
    await _movieProvider.fetchMovies(pageNumber);
  }

  void _loadMoreMovies() async {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        pageNumber++;
        _movieProvider.fetchMovies(pageNumber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadMoreMovies();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Watch what you want',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 30.0),
              SearchTextField(),
              SizedBox(height: 30.0),
              MostRatedMovies(),
              SizedBox(height: 30.0),
              Text(
                'All movies',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 30.0),
              ListMovies(),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
