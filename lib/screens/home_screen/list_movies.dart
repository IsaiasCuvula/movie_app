import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import 'list_movie_tile.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Consumer<MovieProvider>(
      builder: (ctx, provider, widget) {
        final List<Movie> movies = provider.movies;

        return provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: movies.length,
                itemBuilder: (ctx, index) {
                  final Movie movie = movies[index];
                  return ListMovieTile(
                    movie: movie,
                    width: deviceSize.width * 0.20,
                  );
                },
              );
      },
    );
  }
}
