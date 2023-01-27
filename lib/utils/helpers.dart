import 'package:flutter/material.dart';

import '../models/movie.dart';

class Helper {
  static double calculateAverageRatings(Movie movie) {
    final int ratingLength = movie.ratings?.length as int;
    final int totalRating = movie.ratings
        ?.reduce((element1, element2) => element1 + element2) as int;
    return (totalRating / ratingLength).roundToDouble();
  }

  static String getDuration(Movie movie) {
    final String? duration = movie.duration?.replaceAll(RegExp(r'\D'), '');
    return '$duration min';
  }

  static String getGenres(Movie movie) {
    final String genres =
        movie.genres?.reduce((value, element) => '$value, $element') as String;
    return genres;
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

  static Future<void> alertDialog({
    required BuildContext context,
    required String title,
    required String content,
    VoidCallback? onTap,
  }) async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20.0),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onTap,
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 18.8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 18.8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
