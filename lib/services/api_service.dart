import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article_model.dart';

class ApiService {
  static String endPointUrl = "newsapi.org";
  static http.Client client = http.Client();

  static Future<List<Articles>> fetchNews(final queryParameters) async {

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    // Response response =await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=3f1a0e1381c74be2ab644cf747bfad83"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> newsJson = json['articles'];
      return newsJson.map((e) => Articles.fromJson(e)).toList();
    } else {
      print('Error response: ${response.statusCode}');
      print('Error body: ${response.body}');
      throw Exception('Failed to load news');
    }
  }
}
