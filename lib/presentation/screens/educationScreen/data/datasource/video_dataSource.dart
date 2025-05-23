import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talkable_2/core/utils/strings_manager.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/entity/video.dart';

class VideoRemoteDataSource {
  Future<List<Video>> fetchVideos() async {
    final url = Uri.parse('${StringsManager.baseUrl}/get_videos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['videos'];
      return data.map((item) => Video.fromList(item)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}