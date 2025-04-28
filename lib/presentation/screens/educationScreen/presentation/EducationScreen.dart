import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/entity/video.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/usecase/get_videos_usecase.dart';
import 'package:provider/provider.dart'; // تأكد من إضافة المكتبة
import 'package:talkable_2/core/utils/assets_manager.dart';
import 'package:talkable_2/presentation/screens/educationScreen/presentation/video_player_screen.dart';
import 'package:talkable_2/presentation/screens/educationScreen/presentation/video_view_model.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  void initState() {
    super.initState();
    // استدعاء الدالة لجلب الفيديوهات من الـ backend
    context.read<VideoViewModel>().fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Carousel Slider for images
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                      ),
                      items: [
                        AssetsManager.logoPhoto,
                        AssetsManager.privateSession,
                        AssetsManager.translation,
                        AssetsManager.learning,
                      ]
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

                // Show videos when data is loaded
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
                      viewModel.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : viewModel.videos.isEmpty
                          ? Center(child: Text('No videos found'))
                          : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: viewModel.videos.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final video = viewModel.videos[index];
                          return VideoCard(
                            title: video.title,
                            videoUrl: video.videoUrl,
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
      },
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String videoUrl;

  const VideoCard({
    required this.title,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(
              videoUrl: videoUrl,
              title: title,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(AssetsManager.learning),
            SizedBox(height:25),
            Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}