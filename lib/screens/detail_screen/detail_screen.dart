import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/watch_list_movie_provider.dart';
import 'package:movie_app/utils/helpers.dart';
import 'package:provider/provider.dart';

import 'icon_text_row.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<WatchListMovieProvider>(
            builder: (ctx, provider, _) {
              return IconButton(
                onPressed: () async {
                  //provider.saveMovie(movie);
                },
                icon: const Icon(Icons.bookmark_border_outlined),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: deviceSize.width,
              height: deviceSize.height * 0.50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: CachedNetworkImageProvider('${movie.posterurl}'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          '${movie.title}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              getAverageRatingStars(),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'From ${movie.ratings?.length} users',
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  IconTextRow(
                    iconData: Icons.access_time,
                    label: getDuration(),
                  ),
                  IconTextRow(
                    iconData: Icons.calendar_today,
                    label: '${movie.year}',
                  ),
                  IconTextRow(
                    iconData: Icons.category,
                    label: getGenres(),
                  ),
                  IconTextRow(
                    iconData: Icons.people,
                    label: getActors(),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    '${movie.storyline}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }

  String getDuration() {
    final String? duration = movie.duration?.replaceAll(RegExp(r'\D'), '');
    return '$duration min';
  }

  String getGenres() {
    final String genres =
        movie.genres?.reduce((value, element) => '$value, $element') as String;
    return genres;
  }

  String getActors() {
    final String actor =
        movie.actors?.reduce((value, element) => '$value, $element') as String;
    return actor;
  }

  String getAverageRatingStars() {
    final double totalRating = Helper.calculateAverageRatings(movie);
    return '⭐' * totalRating.round();
  }
}
