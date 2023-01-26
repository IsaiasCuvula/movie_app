import 'package:flutter/material.dart';

import '../models/movie.dart';

class Helper {
  static double calculateAverageRatings(Movie movie) {
    final int ratingLength = movie.ratings?.length as int;
    final int totalRating = movie.ratings
        ?.reduce((element1, element2) => element1 + element2) as int;
    return (totalRating / ratingLength).roundToDouble();
  }

  static Route customTransition(Widget child) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (ctx, animation, animation1) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static snackBar(String msg, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
