import 'package:flutter/material.dart';

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
