import 'dart:convert';
import 'package:http/http.dart';
import '../api/model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String endPointUrl = "newsapi.org";
  static http.Client client = http.Client();

  // Future<List<Articles>> getArticle() async {
  // static const String _apiKey = '3f1a0e1381c74be2ab644cf747bfad83';
  //
  //   final queryParameters = {
  //     'country': 'us',
  //     'category': 'technology',
  //     'apiKey': '3f1a0e1381c74be2ab644cf747bfad83'
  //   };
  //
  //   final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
  //   final response = await client.get(uri);
  //   Map<String, dynamic> json = jsonDecode(response.body);
  //   List<dynamic> body = json['articles'];
  //   List<Articles> articles = body.map((dynamic item) => Articles.fromJson(item)).toList();
  //   return articles;
  // }

  // static const String _baseUrl =
  //     'https://newsapi.org/v2/top-headlines?country=in&category=business';

  static Future<List<Articles>> fetchNews(final queryParameters) async {
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);

    final response = await client.get(uri);

    // Response response =await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=3f1a0e1381c74be2ab644cf747bfad83"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> newsJson = json['articles'];
      return newsJson.map((e) => Articles.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
