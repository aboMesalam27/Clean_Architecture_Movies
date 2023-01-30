import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:osama_elgendy_movies/error/fauiler.dart';

abstract class BaseUseCases<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
