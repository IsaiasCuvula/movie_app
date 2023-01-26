import '../models/movie.dart';

class Helper {
  static double calculateAverageRatings(Movie movie) {
    final int ratingLength = movie.ratings?.length as int;
    final int totalRating = movie.ratings
        ?.reduce((element1, element2) => element1 + element2) as int;
    return (totalRating / ratingLength).roundToDouble();
  }
}
