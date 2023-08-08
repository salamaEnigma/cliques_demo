class Post {
  final String id;
  final String authorId;
  final String cliqueId;
  final String cliqueName;
  final String content;
  final String? photoUrl;
  final String? videoUrl;

  final DateTime createdAt;
  final int commentsCount;
  final int likesCount;

  Post({
    required this.id,
    required this.authorId,
    required this.cliqueId,
    required this.content,
    required this.createdAt,
    required this.commentsCount,
    required this.likesCount,
    required this.cliqueName,
    this.photoUrl,
    this.videoUrl,
  });
}
