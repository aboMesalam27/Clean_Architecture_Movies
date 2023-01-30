import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backDropPath;
  final String overView;
  final List<int> genderIds;
  final num voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overView,
    required this.genderIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        overView,
        genderIds,
        voteAverage,
        releaseDate,
      ];
}
