import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/article_model.dart';

class FetchNews{

  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<Articles> fetchNews()async{

    final random = Random();
    var sourceID = sourcesId[random.nextInt(sourcesId.length)];
    const String apiKey = '9f6d210f572a43c2892e84040a32e190';
    Response response =await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=$apiKey"));

    Map bodyData = jsonDecode(response.body);
    List articles = bodyData["articles"];
    var myArticle = articles[random.nextInt(articles.length)];

    return Articles.fromJson(myArticle);

  }
}
class NewsApi {
  static const String _apiKey = '9f6d210f572a43c2892e84040a32e190';
  static const String _baseUrl = 'https://newsapi.org/v2';

  static Future<List<Articles>> fetchTopHeadlines(String sourceId) async {
    final response = await http.get(Uri.parse('$_baseUrl/top-headlines?sources=$sourceId&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> articlesJson = json['articles'];
      return articlesJson
          .map((articleJson) => Articles.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to fetch top headlines.');
    }
  }
}
