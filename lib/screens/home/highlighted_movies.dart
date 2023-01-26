import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';

class HighlightedMovies extends StatelessWidget {
  const HighlightedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Consumer<MovieProvider>(
      builder: (ctx, provider, _) {
        final List<Movie> movies = provider.randomMovies;
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
                    return InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (ctx, animation, animation1) {
                              return FadeTransition(
                                opacity: animation,
                                child: DetailScreen(movie: movie),
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: deviceSize.width * 0.42,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: '${movie.posterurl}',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${movie.title}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text('${movie.poster}', maxLines: 1),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 6.0),
                                      Text(getRatings(movie), maxLines: 1),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

  String getRatings(Movie movie) {
    final int ratingLength = movie.ratings?.length as int;
    final int totalRating = movie.ratings
        ?.reduce((element1, element2) => element1 + element2) as int;
    return '${(totalRating / ratingLength).roundToDouble()}';
  }
}
