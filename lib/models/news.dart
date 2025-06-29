class News {
  final String title;
  final String description;
  final String fullContent;
  final String category;
  final String source;
  final List<String> tags;
  final String imageUrl;
  final DateTime publishedAt;
  final String link;

  News({
    required this.title,
    required this.description,
    required this.fullContent,
    required this.category,
    required this.source,
    required this.tags,
    required this.imageUrl,
    required this.publishedAt,
    required this.link,
  });

  factory News.fromFinnhubJson(Map<String, dynamic> json) {
    return News(
      title: json['headline'] ?? '',
      description: json['summary'] ?? '',
      fullContent: json['summary'] ?? '',
      category: json['category'] ?? '',
      source: json['source'] ?? '',
      tags: [],
      imageUrl: json['image'] ?? '',
      publishedAt: DateTime.tryParse(json['datetime'] != null
          ? (json['datetime'] * 1000).toString()
          : '') ?? DateTime.now(),
      link: json['url'] ?? '',
    );
  }

}
