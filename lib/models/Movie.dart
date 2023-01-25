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
 String? imdbRating;
 String? posterurl;

  Movie({
     required this.id,
     required this.title,
     required this.year,
     required this.genres,
     required this.ratings,
     required this.poster,
     required this.contentRating,
     required this.duration,
     required this.releaseDate,
     required this.averageRating,
     required this.originalTitle,
     required this.storyline,
     required this.actors,
     required this.imdbRating,
     required this.posterurl,
  });

  factory Movie.fromJson(dynamic json) => Movie(
    id : json['id'],
    title : json['title'],
    year : json['year'],
    genres : json['genres'] != null ? json['genres'].cast<String>() : [],
    ratings : json['ratings'] != null ? json['ratings'].cast<int>() : [],
    poster : json['poster'],
    contentRating :json['contentRating'],
    duration : json['duration'],
    releaseDate : json['releaseDate'],
    averageRating : json['averageRating'],
    originalTitle : json['originalTitle'],
    storyline : json['storyline'],
    actors: json['actors'] != null ? json['actors'].cast<String>() : [],
    imdbRating : json['imdbRating'],
    posterurl : json['posterurl'],
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