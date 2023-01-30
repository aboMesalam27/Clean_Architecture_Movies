import 'package:dartz/dartz.dart';
import 'package:osama_elgendy_movies/use_cases/base_use_case.dart';

import '../../../error/fauiler.dart';
import '../entities/movie.dart';
import '../repositires/base_movie_repo.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCases<List<Movie>,NoParams> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
