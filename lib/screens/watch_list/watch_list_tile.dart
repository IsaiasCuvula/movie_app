import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/helpers.dart';

import '../../models/movie.dart';
import '../detail_screen/icon_text_row.dart';

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
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: CachedNetworkImage(
              imageUrl: '${movie.posterurl}',
              fit: BoxFit.cover,
            ),
          ),
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
              IconTextRow(
                iconData: Icons.star_border,
                label: '${Helper.calculateAverageRatings(movie)}',
                color: Colors.amber,
              ),
              IconTextRow(
                iconData: Icons.category,
                label: Helper.getGenres(movie),
              ),
              IconTextRow(
                iconData: Icons.calendar_today,
                label: '${movie.year}',
              ),
              IconTextRow(
                iconData: Icons.access_time,
                label: Helper.getDuration(movie),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
