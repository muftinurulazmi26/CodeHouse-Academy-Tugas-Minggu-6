class News {
  late String author;
  late String title;
  late String description;
  late String urlToImage;
  late String publishedAt;

  News({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
        author: (map["author"] ?? ""),
        title: map["title"],
        description: map["description"],
        urlToImage: (map["urlToImage"] ?? ""),
        publishedAt: map["publishedAt"]);
  }
}
