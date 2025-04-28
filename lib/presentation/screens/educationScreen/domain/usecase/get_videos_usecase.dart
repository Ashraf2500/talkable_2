


import 'package:talkable_2/presentation/screens/educationScreen/domain/entity/video.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/repository/video_repository.dart';

class GetVideosUseCase {
  final VideoRepository repository;

  GetVideosUseCase(this.repository);

  Future<List<Video>> execute() {
    return repository.getVideos();
  }
}