/// videos : [[1,"A","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-591-1.mp4"],[2,"B","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-592-1.mp4"],[3,"C","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-593-1.mp4"],[4,"D","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-594-1.mp4"],[5,"E","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-595-1.mp4"],[6,"F","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-596-1.mp4"],[7,"G","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-597-1.mp4"],[8,"H","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-598-1.mp4"],[9,"I","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-599-1.mp4"],[10,"J","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-600-1.mp4"],[11,"K","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-601-1.mp4"],[12,"L","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-602-1.mp4"],[13,"M","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-603-1.mp4"],[14,"N","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-604-1.mp4"],[15,"O","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-605-1.mp4"],[16,"P","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-606-1.mp4"],[17,"Q","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-607-1.mp4"],[18,"R","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-608-1.mp4"],[19,"S","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-609-1.mp4"],[20,"T","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-610-1.mp4"],[21,"U","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-611-1.mp4"],[22,"V","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-612-1.mp4"],[23,"W","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-613-1.mp4"],[24,"X","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-614-1.mp4"],[25,"Y","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-615-1.mp4"],[26,"Z","https://media.spreadthesign.com/video/mp4/13/alphabet-letter-616-1.mp4"]]

class VideosResponseModel {
  VideosResponseModel({
      this.videos,});

  VideosResponseModel.fromJson(dynamic json) {
    videos = json['videos'] != null ? json['videos'].cast<num>() : [];
  }
  List<List<num>>? videos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['videos'] = videos;
    return map;
  }

}