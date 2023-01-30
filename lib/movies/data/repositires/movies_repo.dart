import 'package:dartz/dartz.dart';
import 'package:osama_elgendy_movies/error/exceptions.dart';
import 'package:osama_elgendy_movies/error/fauiler.dart';
import 'package:osama_elgendy_movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/movie.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/movie_details.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/recommend.dart';
import 'package:osama_elgendy_movies/movies/domain/repositires/base_movie_repo.dart';
import 'package:osama_elgendy_movies/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama_elgendy_movies/movies/domain/usecases/get_recommendation_use_case.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRaredMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendations(parameters);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required ParametersMovieDetails parametersMovieDetails}) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(
        parametersMovieDetails: parametersMovieDetails);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
