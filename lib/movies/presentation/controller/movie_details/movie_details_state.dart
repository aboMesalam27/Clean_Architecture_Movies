part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation>? recommendationsList;
  final RequestState recommendationsState;
  final String recommendationsMessage;
  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendationsList,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationsList: recommendationsList ?? this.recommendationsList,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationsList,
    this.recommendationsState = RequestState.loading,
    this.recommendationsMessage = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
      ];
}
