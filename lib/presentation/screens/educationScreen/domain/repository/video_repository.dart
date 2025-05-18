import 'package:http/http.dart' as http;
import 'package:talkable_2/core/utils/strings_manager.dart';
import 'dart:convert';
import 'package:talkable_2/presentation/screens/educationScreen/domain/entity/video.dart';

class VideoRepository {
 // final String baseUrl;

//  VideoRepository({required this.baseUrl});

  Future<List<Video>> getVideos() async {
    final url = Uri.parse('${StringsManager.baseUrl}/get_videos'); // URL الـ API الخاص بك

    try {
      final response = await http.get(url); // طلب الـ GET للـ API

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['videos']; // تحليل البيانات من JSON

        return data.map((videoData) {
          return Video(
            id: videoData[0],  // كما في البيانات التي أرسلتها
            title: videoData[1],
            videoUrl: videoData[2],
          );
        }).toList();
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      throw Exception('Error fetching videos: $e');
    }
  }
}
