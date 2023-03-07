import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_everyday/utils/message.dart';
import '../model/article_model.dart';

class ApiService {
  static String endPointUrl = "newsapi.org";
  static http.Client client = http.Client();
  static Future<List<Articles>> searchNews(final queryParameters) async {
    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> articlesJson = json['articles'];
      return articlesJson
          .map((articleJson) => Articles.fromJson(articleJson))
          .toList();
    } else {
      MessageDialog().snackBarGetCut("News Loading Issues", "Your Daily News Limit are used");
      throw Exception('Failed to load news');
    }
  }
}
// sortBy : The order to sort the articles in. Possible options: relevancy, popularity, publishedAt.
// relevancy = articles more closely related to q come first.
// popularity = articles from popular sources and publishers come first.
// publishedAt = newest articles come first.