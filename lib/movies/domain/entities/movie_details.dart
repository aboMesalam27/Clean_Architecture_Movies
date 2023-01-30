import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final int id;
  final int runTime;
  final num voteAverage;
  final String overview;
  final String releaseDate;
  final String title;
  final List<Genres> genresList;
  const MovieDetails({
    required this.backDropPath,
    required this.id,
    required this.runTime,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.genresList,
  });

  @override
  List<Object?> get props => [
        backDropPath,
        id,
        runTime,
        voteAverage,
        overview,
        releaseDate,
        title,
        genresList
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;
  const Genres({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}

