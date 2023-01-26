import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/list_movie_tile.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';

class MostRatedMovies extends StatelessWidget {
  const MostRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Consumer<MovieProvider>(
      builder: (ctx, provider, _) {
        final List<Movie> movies = provider.mostRatedMovies;
        return SizedBox(
          height: deviceSize.height * 0.30,
          child: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: movies.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    final Movie movie = movies[index];
                    return ListMovieTile(
                      movie: movie,
                      width: deviceSize.width * 0.42,
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(width: 20.0);
                  },
                ),
        );
      },
    );
  }
}
