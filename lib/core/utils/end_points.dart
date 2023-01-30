import 'package:osama_elgendy_movies/core/utils/constatnt.dart';

class EndPoints {
  static const String getNowPlaying =
      '${AppConstant.baseUrl}/movie/now_playing?api_key=${AppConstant.apiKey}';
  static const String getPopular =
      '${AppConstant.baseUrl}/movie/popular?api_key=${AppConstant.apiKey}';
  static const String getTopRated =
      '${AppConstant.baseUrl}/movie/top_rated?api_key=${AppConstant.apiKey}';
  static String getMovieDetails({required movieId}) =>
      '${AppConstant.baseUrl}/movie/$movieId?api_key=${AppConstant.apiKey}';
  static String getMovieRecommendation({required movieId}) =>
      '${AppConstant.baseUrl}/movie/$movieId/recommendations?api_key=${AppConstant.apiKey}';
}
// https://api.themoviedb.org/3/movie/315162?api_key=6a36950154012da14567ec1683fba2f3