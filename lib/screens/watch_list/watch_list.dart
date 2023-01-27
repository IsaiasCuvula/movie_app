import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/watch_list_movie_provider.dart';
import 'package:movie_app/screens/watch_list/watch_list_tile.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:provider/provider.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch list'),
      ),
      body: Padding(
        padding: kPadding20,
        child: Consumer<WatchListMovieProvider>(
          builder: (ctx, provider, _) {
            final List<Movie> movies = provider.watchListMovie;
            return movies.isEmpty
                ? const Center(
                    child: Text(
                      'There is no movie\nin your watch list yet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (ctx, index) {
                      final Movie movie = movies[index];
                      return Dismissible(
                        key: Key('${movie.id}'),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          child: const Icon(
                            Icons.delete,
                            size: 28.0,
                          ),
                        ),
                        onDismissed: (direction) {
                          provider.removeMovieFromFavorite(movie);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${movie.title} removed from favourite',
                              ),
                              action: SnackBarAction(
                                label: 'undo',
                                onPressed: () {
                                  provider.saveMovieToFavorite(movie);
                                },
                              ),
                            ),
                          );
                        },
                        child: WatchListMovieTile(movie: movie),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(height: 20.0);
                    },
                    itemCount: movies.length,
                  );
          },
        ),
      ),
    );
  }
}
