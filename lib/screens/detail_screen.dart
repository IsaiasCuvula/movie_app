import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print('save in favorites');
            },
            icon: const Icon(Icons.bookmark_border_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 3,
                        child: Column(
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
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 18.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        getDuration(),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Text(
                    'Release date: ${movie.year}',
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    getGenres(),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    getActors(),
                    textAlign: TextAlign.start,
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
    final int ratingLength = movie.ratings?.length as int;
    final int totalRating = movie.ratings
        ?.reduce((element1, element2) => element1 + element2) as int;
    return '⭐' * (totalRating / ratingLength).round();
  }
}
