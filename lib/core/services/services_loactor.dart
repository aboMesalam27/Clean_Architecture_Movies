import 'package:get_it/get_it.dart';
import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repositires/movies_repo.dart';
import '../../movies/domain/repositires/base_movie_repo.dart';
import '../../movies/domain/usecases/get_movie_details_use_case.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommendation_use_case.dart';
import '../../movies/domain/usecases/get_top_tared_movies_usecase.dart';
import '../../movies/presentation/controller/movie/movies_bloc.dart';
import '../../movies/presentation/controller/movie_details/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLOC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    ///USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    ///REPOSITORY

    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
