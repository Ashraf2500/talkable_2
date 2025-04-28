import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:talkable_2/core/utils/assets_manager.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  List<dynamic> videos = [];
  bool isLoading = true;

  Future<void> fetchVideos() async {
    final url = Uri.parse('http://127.0.0.1:5000/get_videos');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          videos = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching videos: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      AssetsManager.logoPhoto,
      AssetsManager.privateSession,
      AssetsManager.translation,
      AssetsManager.learning
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                  ),
                  items: imgList
                      .map((item) => Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Learning Videos',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : videos.isEmpty
                      ? Center(child: Text('No videos found'))
                      : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final video = videos[index];
                      return VideoCard(
                        imageUrl: video['thumbnail'] ?? '',
                        title: video['title'] ?? 'No Title',
                        details: video['description'] ?? '',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String details;

  VideoCard({
    required this.imageUrl,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: 120,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  details,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
