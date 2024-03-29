class Articles {
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  Articles(
      {required this.title,
      required this.description,
      required this.urlToImage,
      required this.url,
      required this.content,
      required this.publishedAt});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ??
          "https://static.vecteezy.com/system/resources/thumbnails/006/299/370/original/world-breaking-news-digital-earth-hud-rotating-globe-rotating-free-video.jpg",
      url: json['url'] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }

  //store data from firebase FireStore
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
    };
  }
}
