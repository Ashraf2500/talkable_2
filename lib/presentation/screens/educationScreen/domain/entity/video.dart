class Video {
  final int id;
  final String title;
  final String videoUrl;

  Video({
    required this.id,
    required this.title,
    required this.videoUrl,
  });

  factory Video.fromList(List<dynamic> data) {
    return Video(
      id: data[0],
      title: data[1],
      videoUrl: data[2],
    );
  }
}