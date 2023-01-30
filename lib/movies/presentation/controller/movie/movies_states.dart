import 'package:equatable/equatable.dart';
import 'package:osama_elgendy_movies/core/utils/enums.dart';

import '../../../domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMoviesList;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMoviesList;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMoviesList;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlayingMoviesList = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMoviesList = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMoviesList = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });
  MoviesStates copyWith({
    List<Movie>? nowPlayingMoviesList,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMoviesList,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMoviesList,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMoviesList: topRatedMoviesList ?? this.topRatedMoviesList,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMoviesList,
        nowPlayingState,
        nowPlayingMessage,
        popularMoviesList,
        popularState,
        popularMessage,
        topRatedMoviesList,
        topRatedState,
        topRatedMessage
      ];
}
