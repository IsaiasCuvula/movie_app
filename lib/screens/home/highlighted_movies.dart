import 'package:flutter/material.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';

class HighlightedMovies extends StatelessWidget {
  HighlightedMovies({Key? key, required this.deviceSize}) : super(key: key);

  final Size deviceSize;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        movieProvider.fetchMovies();
      }
    });

    return Consumer<MovieProvider>(
      builder: (ctx, provider, _) {
        final List<Movie> movies = provider.movies;
        return SizedBox(
          height: deviceSize.height * 0.25,
          child: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: movies.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemBuilder: (ctx, index) {
                    final Movie movie = movies[index];
                    return InkWell(
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
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0),
                          // image: DecorationImage(
                          //     image: ,
                          // ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Jurassic World Jurassic',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Text('Isaias', maxLines: 1),
                            SizedBox(height: 10.0),
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
}
