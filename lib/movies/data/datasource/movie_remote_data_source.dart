import 'package:dio/dio.dart';
import 'package:osama_elgendy_movies/core/utils/end_points.dart';
import 'package:osama_elgendy_movies/error/exceptions.dart';
import 'package:osama_elgendy_movies/movies/data/models/movie_details_model.dart';
import 'package:osama_elgendy_movies/movies/data/models/movie_model.dart';
import 'package:osama_elgendy_movies/movies/data/models/recommendation_model.dart';
import 'package:osama_elgendy_movies/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama_elgendy_movies/network/error_message_model.dart';
import '../../domain/usecases/get_recommendation_use_case.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRaredMovies();
  Future<MovieDetailsModel> getMovieDetails(
      {required ParametersMovieDetails parametersMovieDetails});
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters recommendationParameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(EndPoints.getNowPlaying);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(EndPoints.getPopular);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRaredMovies() async {
    final response = await Dio().get(EndPoints.getTopRated);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      {required ParametersMovieDetails parametersMovieDetails}) async {
    final response = await Dio().get(EndPoints.getMovieDetails(movieId: parametersMovieDetails.id));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJSON(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters recommendationParameters) async {
    final response = await Dio().get(
        EndPoints.getMovieRecommendation(movieId: recommendationParameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
