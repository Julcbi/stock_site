class News {
  final String title;
  final String description;
  final String category;
  final String source;
  final List<String> tags;
  final String imageUrl;
  final DateTime publishedAt;
  final String link;

  News({
    required this.title,
    required this.description,
    required this.category,
    required this.source,
    required this.tags,
    required this.imageUrl,
    required this.publishedAt,
    required this.link,
  });
}
