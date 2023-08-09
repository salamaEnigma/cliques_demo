class Comment {
  final String date;
  final String author;
  final String content;
  final String? imageUrl;
  final String? videoUrl;
  final String? userProfilePictureUrl;
  Comment({
    required this.date,
    required this.author,
    required this.content,
    this.imageUrl,
    this.videoUrl,
    this.userProfilePictureUrl,
  });
}