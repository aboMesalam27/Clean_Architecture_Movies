import 'package:osama_elgendy_movies/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backDropPath,
    required super.overView,
    required super.genderIds,
    required super.voteAverage,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      backDropPath: json['backdrop_path'],
      genderIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overView: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'],
    );
  }
}
