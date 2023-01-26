import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/movie.dart';
import 'image_error_placeholder.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (ctx, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
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
        title: '${movie.title}',
      ),
      imageUrl: '${movie.posterurl}',
    );
  }
}
