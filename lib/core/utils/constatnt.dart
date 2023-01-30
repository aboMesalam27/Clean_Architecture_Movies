class AppConstant {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '6a36950154012da14567ec1683fba2f3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
