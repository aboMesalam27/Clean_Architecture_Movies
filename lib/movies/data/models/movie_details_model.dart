import 'package:osama_elgendy_movies/movies/data/models/genurs_model.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backDropPath,
    required super.id,
    required super.runTime,
    required super.voteAverage,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.genresList,
  });

  factory MovieDetailsModel.fromJSON(Map<String, dynamic> json) {
    return MovieDetailsModel(
        backDropPath: json['backdrop_path'],
        id: json['id'],
        runTime: json['runtime'],
        voteAverage: json['vote_average'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        title: json['title'],
        genresList: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJSON(x))));
  }
}
