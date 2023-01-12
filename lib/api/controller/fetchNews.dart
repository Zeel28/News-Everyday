// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=3f1a0e1381c74be2ab644cf747bfad83
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/news_art.dart';

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

  static Future<NewsArt> fetchNews()async{

    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];

    // print(sourceID);

    // Response response =await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=3f1a0e1381c74be2ab644cf747bfad83"));
    Response response =await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=459f208e91ae40e3a7f6477321f9e61e"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    // print(articles);
    // print(body_data);
print("**************************************************");
    final _Newrandom = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];
    print(myArticle);
    print("****************************************************************");

    return NewsArt.fromAPItoApp(myArticle);

  }
}