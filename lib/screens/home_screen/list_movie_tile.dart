import 'package:flutter/material.dart';
import 'package:movie_app/screens/detail_screen/icon_text_row.dart';
import 'package:movie_app/utils/helpers.dart';

import '../../models/movie.dart';
import '../detail_screen/detail_screen.dart';
import 'cached_image.dart';

class ListMovieTile extends StatelessWidget {
  const ListMovieTile({
    Key? key,
    required this.movie,
    required this.width,
  }) : super(key: key);

  final Movie movie;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        Navigator.push(
          context,
          Helper.customTransition(DetailScreen(movie: movie)),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: CachedImage(movie: movie),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movie.title}',
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                  Text('${movie.poster}', maxLines: 1),
                  IconTextRow(
                    iconData: Icons.star_border,
                    label: getRatings(movie),
                    color: Colors.amber,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getRatings(Movie movie) {
    return '${Helper.calculateAverageRatings(movie)}';
  }
}
