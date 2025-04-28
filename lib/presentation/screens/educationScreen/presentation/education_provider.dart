import 'package:flutter/material.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/entity/video.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/usecase/get_videos_usecase.dart';

class EducationProvider extends ChangeNotifier {
  final GetVideosUseCase getVideosUseCase;

  EducationProvider(this.getVideosUseCase);

  List<Video> _videos = [];
  List<Video> get videos => _videos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchVideos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _videos = await getVideosUseCase.execute();
    } catch (e) {
      print('Error fetching videos: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}