import 'package:osama_elgendy_movies/movies/domain/entities/movie_details.dart';

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });
  factory GenresModel.fromJSON(Map<String, dynamic>json){
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
