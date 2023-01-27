import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen/search_text_field.dart';
import 'package:movie_app/screens/profile_screen/profile_screen.dart';
import 'package:movie_app/screens/watch_list/watch_list.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
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
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: kPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Text(
                  'Movie App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Watch list'),
              onTap: () {
                Navigator.push(
                  context,
                  Helper.customTransition(const WatchList()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  Helper.customTransition(const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
