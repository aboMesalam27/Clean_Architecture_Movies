import 'package:osama_elgendy_movies/movies/domain/entities/recommend.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backDrpPath,
    required super.id,
  });
  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      backDrpPath: json['backdrop_path'] ?? "/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg",
    );
  }
}
