import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/watch_list_movie_provider.dart';
import 'package:movie_app/screens/detail_screen/icon_text_row.dart';
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
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final Movie movie = movies[index];
                return WatchListMovieTile(movie: movie);
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

class WatchListMovieTile extends StatelessWidget {
  const WatchListMovieTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Flexible(
          child: Icon(Icons.ac_unit_outlined, size: 100),
        ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${movie.title}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const IconTextRow(
                iconData: Icons.star_border,
                label: '9.5',
                color: Colors.amber,
              ),
              const IconTextRow(
                iconData: Icons.category,
                label: 'Action',
              ),
              IconTextRow(
                iconData: Icons.calendar_today,
                label: '${movie.year}',
              ),
              const IconTextRow(
                iconData: Icons.access_time,
                label: '139 minutes',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
