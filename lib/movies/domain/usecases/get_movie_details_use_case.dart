import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:osama_elgendy_movies/error/fauiler.dart';
import 'package:osama_elgendy_movies/movies/domain/entities/movie_details.dart';
import 'package:osama_elgendy_movies/movies/domain/repositires/base_movie_repo.dart';
import 'package:osama_elgendy_movies/use_cases/base_use_case.dart';

class GetMovieDetailsUseCase
    extends BaseUseCases<MovieDetails, ParametersMovieDetails> {
  BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      ParametersMovieDetails params) async {
    return await baseMovieRepository.getMovieDetails(parametersMovieDetails: params);
  }
}

class ParametersMovieDetails extends Equatable {
  final int id;

  const ParametersMovieDetails({required this.id});

  @override
  List<Object?> get props => [id];
}
