import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/Movie.dart';
import '../../widgets/image_error_placeholder.dart';
import '../detail_screen.dart';

class ListMovieTile extends StatelessWidget {
  const ListMovieTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
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
      child: CachedNetworkImage(
        imageBuilder: (ctx, imageProvider) {
          return Container(
            width: deviceSize.width * 0.20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageProvider,
              ),
            ),
          );
        },
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => ImageErrorPlaceHolder(
          width: deviceSize.width * 0.20,
          title: '${movie.title}',
        ),
        imageUrl: '${movie.posterurl}',
      ),
    );
  }
}
