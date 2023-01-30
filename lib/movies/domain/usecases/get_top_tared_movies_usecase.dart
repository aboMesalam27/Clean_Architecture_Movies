import 'package:dartz/dartz.dart';
import 'package:osama_elgendy_movies/movies/domain/repositires/base_movie_repo.dart';

import '../../../error/fauiler.dart';
import '../../../use_cases/base_use_case.dart';
import '../entities/movie.dart';

class GetTopRatedMoviesUseCase extends BaseUseCases<List<Movie>, NoParams> {
  BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
