

class SignVideo {
  final String character;
  final String video;

  SignVideo({required this.character, required this.video});

  factory SignVideo.fromJson(Map<String, dynamic> json) {
    return SignVideo(
      character: json['character'],
      video: json['video'],
    );
  }
}