import 'package:flutter/material.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/entity/video.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/usecase/get_videos_usecase.dart';

class VideoViewModel extends ChangeNotifier {
  final GetVideosUseCase getVideosUseCase;

  VideoViewModel({required this.getVideosUseCase});

  List<Video> _videos = [];
  List<Video> get videos => _videos;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchVideos() async {
    _isLoading = true;
    notifyListeners();

    try {
      // استدعاء execute() للحصول على الفيديوهات من الـ repository
      final videos = await getVideosUseCase.execute();
      _videos = videos;
    } catch (e) {
      print('Error fetching videos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
