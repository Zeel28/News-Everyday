import 'dart:convert';

import '../api/model/article_model.dart';
import 'package:http/http.dart' as http;
class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Articles>> getArticle() async {

    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': '3f1a0e1381c74be2ab644cf747bfad83'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Articles> articles = body.map((dynamic item) => Articles.fromJson(item)).toList();
    return articles;
  }
}