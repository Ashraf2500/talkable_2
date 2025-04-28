import 'package:flutter/material.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/entity/video.dart';
import 'package:video_player/video_player.dart';

class VideoCardWidget extends StatefulWidget {
  final Video video;

  const VideoCardWidget({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoCardWidget> createState() => _VideoCardWidgetState();
}

class _VideoCardWidgetState extends State<VideoCardWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(height: 120, child: Center(child: CircularProgressIndicator())),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.video.title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          IconButton(
            icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying ? _controller.pause() : _controller.play();
              });
            },
          ),
        ],
      ),
    );
  }
}