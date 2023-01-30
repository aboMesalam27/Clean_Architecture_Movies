import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backDrpPath;
  final int id;

  const Recommendation({
     this.backDrpPath,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [backDrpPath, id];
}
