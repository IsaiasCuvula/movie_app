class Movie {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  String? contentRating;
  String? duration;
  String? releaseDate;
  int? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  dynamic imdbRating;
  String? posterurl;

  Movie({
    this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterurl,
  });

  factory Movie.fromJson(dynamic json) => Movie(
        id: json['id'],
        title: json['title'],
        year: json['year'],
        genres: json['genres'] != null ? json['genres'].cast<String>() : [],
        ratings: json['ratings'] != null ? json['ratings'].cast<int>() : [],
        poster: json['poster'],
        contentRating: json['contentRating'],
        duration: json['duration'],
        releaseDate: json['releaseDate'],
        averageRating: json['averageRating'],
        originalTitle: json['originalTitle'],
        storyline: json['storyline'],
        actors: json['actors'] != null ? json['actors'].cast<String>() : [],
        imdbRating: json['imdbRating'],
        posterurl: json['posterurl'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year'] = year;
    map['genres'] = genres;
    map['ratings'] = ratings;
    map['poster'] = poster;
    map['contentRating'] = contentRating;
    map['duration'] = duration;
    map['releaseDate'] = releaseDate;
    map['averageRating'] = averageRating;
    map['originalTitle'] = originalTitle;
    map['storyline'] = storyline;
    map['actors'] = actors;
    map['imdbRating'] = imdbRating;
    map['posterurl'] = posterurl;
    return map;
  }
}
