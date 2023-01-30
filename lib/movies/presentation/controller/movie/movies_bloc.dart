import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osama_elgendy_movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../../../core/utils/enums.dart';
import '../../../../use_cases/base_use_case.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_tared_movies_usecase.dart';
import 'movies_events.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRaredMoviesUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRaredMoviesUseCase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovie);

    on<GetPopularMovieEvent>(_getPopularMovie);

    on<GetTopRatedMovieEvent>(_getTopRatedMovie);
  }

  FutureOr<void> _getNowPlayingMovie(
      GetNowPlayingMovieEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParams());
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingMoviesList: r,
        nowPlayingState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getPopularMovie(
      GetPopularMovieEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUseCase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMoviesList: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovie(
      GetTopRatedMovieEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTopRaredMoviesUseCase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMoviesList: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
