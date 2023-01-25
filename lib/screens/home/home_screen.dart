import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/search_text_field.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';
import '../../utils/constants.dart';
import 'highlighted_movies.dart';
import 'list_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieProvider _movieProvider;

  @override
  void initState() {
    super.initState();
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Watch what you want',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 30.0),
              const SearchTextField(),
              const SizedBox(height: 30.0),
              HighlightedMovies(deviceSize: deviceSize),
              const SizedBox(height: 30.0),
              const Text(
                'Movies coming soon',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 30.0),
              ListMovies(deviceSize: deviceSize),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
