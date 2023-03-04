import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_everyday/utils/message.dart';
import '../model/article_model.dart';


class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = '9f6d210f572a43c2892e84040a32e190';

  static Future<List<Articles>> searchNews(String query) async {
    final url = '$_baseUrl/everything?q=$query&sortBy=publishedAt&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> articlesJson = json['articles'];
      return articlesJson
          .map((articleJson) => Articles.fromJson(articleJson))
          .toList();
    } else {
      MessageDialog().snackBarGetCut("News Loading Issues", "");
      throw Exception('Failed to load news');
    }
  }
}