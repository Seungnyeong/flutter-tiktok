class VideoModel {
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
    };
  }
}
