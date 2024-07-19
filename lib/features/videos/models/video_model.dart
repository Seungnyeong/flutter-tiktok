class VideoModel {
  final String id;
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final String creator;
  final String creatorUid;
  final int liked;
  final int comments;
  final int createdAt;

  VideoModel({
    required this.id,
    required this.description,
    required this.fileUrl,
    required this.thumbnailUrl,
    required this.liked,
    required this.comments,
    required this.creator,
    required this.creatorUid,
    required this.createdAt,
    required this.title,
  });

  VideoModel.fromJson(
      {required Map<String, dynamic> json, required String videoId})
      : description = json["description"],
        fileUrl = json["fileUrl"],
        thumbnailUrl = json["thumbnailUrl"],
        liked = json["liked"],
        comments = json["comments"],
        creator = json["creator"],
        creatorUid = json["creatorUid"],
        createdAt = json["createdAt"],
        id = videoId,
        title = json["title"];

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "fileUrl": fileUrl,
      "thumbnailUrl": thumbnailUrl,
      "liked": liked,
      "comments": comments,
      "creator": creator,
      "creatorUid": creatorUid,
      "createdAt": createdAt,
      "title": title,
      "id": id,
    };
  }
}
