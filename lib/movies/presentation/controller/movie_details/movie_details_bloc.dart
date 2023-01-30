import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:osama_elgendy_movies/core/utils/enums.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/movie_details.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/recommend.dart';
import 'package:osama_elgendy_movies/movies/domain/usecases/get_movie_details_use_case.dart';

import '../../../domain/usecases/get_recommendation_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendedEvent>(_getMovieRecommendations);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(ParametersMovieDetails(
      id: event.id,
    ));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendations(
      GetMovieRecommendedEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
      (l) => emit(state.copyWith(
          recommendationsState: RequestState.error,
          recommendationsMessage: l.message)),
      (r) => emit(
        state.copyWith(
          recommendationsState: RequestState.loaded,
          recommendationsList: r,
        ),
      ),
    );
  }
}
