import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../model/article_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  List<Articles> _articles = [];

  void _searchNews(String query) async {
    final articles = await NewsApi.searchNews(query);
    setState(() {
      _articles = articles;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(hintText: 'Search news'),
          onSubmitted: (value) {
            _searchNews(value);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _articles.length,
        itemBuilder: (context, index) {
          final article = _articles[index];
          return ListTile(
            title: Text(article.title),
            subtitle: Text(article.description),
            onTap: () {
              // TODO: Navigate to article detail page
            },
          );
        },
      ),
    );
  }
}

class IpInfoApi {
  static Future<String?> getIpAddress() async {
    try {
      Response response = await http.get(Uri.parse("https://api.ipify.org/"));
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      return null;
    }
  }
}


class NewsApi {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = '9f6d210f572a43c2892e84040a32e190';

  static Future<List<Articles>> searchNews(String query) async {
    final url = '$_baseUrl/everything?q=$query&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> articlesJson = json['articles'];
      return articlesJson.map((articleJson) => Articles.fromJson(articleJson)).toList();
    } else {
      print('Error response: ${response.statusCode}');
      print('Error body: ${response.body}');
      throw Exception('Failed to load news');
    }
  }
}
