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

  //final movieProvider = Provider.of<MovieProvider>(context, listen: false);
  // _scrollController.addListener(() {
  // if (_scrollController.position.pixels ==
  // _scrollController.position.maxScrollExtent) {
  // movieProvider.fetchMovies();
  // }
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //controller: _scrollController,
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
              HighlightedMovies(),
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
