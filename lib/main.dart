import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/utils/movie_app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => MovieProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: MovieAppTheme.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
