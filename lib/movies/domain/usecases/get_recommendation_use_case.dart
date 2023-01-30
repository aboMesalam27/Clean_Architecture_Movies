import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:osama_elgendy_movies/error/fauiler.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/recommend.dart';
import 'package:osama_elgendy_movies/movies/domain/repositires/base_movie_repo.dart';
import 'package:osama_elgendy_movies/use_cases/base_use_case.dart';

class GetRecommendationUseCase
    extends BaseUseCases<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters params) async {
    return await baseMovieRepository.getRecommendations(params);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
