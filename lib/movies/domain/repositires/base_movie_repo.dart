import 'package:dartz/dartz.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/movie_details.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/recommend.dart';
import 'package:osama_elgendy_movies/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama_elgendy_movies/movies/domain/usecases/get_recommendation_use_case.dart';
import '../../../error/fauiler.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required ParametersMovieDetails parametersMovieDetails});
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameters recommendationParameters);
}
