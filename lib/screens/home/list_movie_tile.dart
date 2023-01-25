import 'package:flutter/material.dart';

import '../../models/Movie.dart';
import '../detail_screen.dart';

class ListMovieTile extends StatelessWidget {
  const ListMovieTile({
    Key? key,
    required this.deviceSize,
    required this.movie,
  }) : super(key: key);

  final Size deviceSize;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
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
        width: deviceSize.width * 0.20,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20.0),
          // image: DecorationImage(
          //     image: ,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${movie.title}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text('${movie.year}', maxLines: 1),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
