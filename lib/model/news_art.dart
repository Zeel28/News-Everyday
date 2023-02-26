class NewsArt {
  String imagUrl;
  String newsCnt;
  String newsDes;
  String newsHead;
  String newsUrl;

  NewsArt(
      {required this.imagUrl,
      required this.newsCnt,
      required this.newsDes,
      required this.newsHead,
      required this.newsUrl});

  static NewsArt fromAPItoApp(Map<String, dynamic> articles) {
    return NewsArt(
        imagUrl: articles["urlToImage"] ?? "https://static.vecteezy.com/system/resources/thumbnails/006/299/370/original/world-breaking-news-digital-earth-hud-rotating-globe-rotating-free-video.jpg",
        newsCnt: articles["content"] ?? "--",
        newsDes: articles["description"] ?? "--",
        newsHead: articles["title"] ?? "--",
        newsUrl: articles["url"] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en");
  }
}
