import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model/article_model.dart';

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
    Response response =await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=459f208e91ae40e3a7f6477321f9e61e"));

    Map bodyData = jsonDecode(response.body);
    List articles = bodyData["articles"];
    var myArticle = articles[random.nextInt(articles.length)];

    return Articles.fromJson(myArticle);

  }
}
