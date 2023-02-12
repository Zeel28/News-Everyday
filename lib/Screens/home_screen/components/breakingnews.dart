import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../api/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BreakingNews extends StatefulWidget {
  BreakingNews({
    super.key,
  });


  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  List<Articles> article = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    Response response =await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2023-01-12&sortBy=publishedAt&apiKey=3f1a0e1381c74be2ab644cf747bfad83"));

    if (response.statusCode == 200) {
      setState(() {
        article = (json.decode(response.body)['articles'] as List)
            .map((data) => Articles.fromJson(data))
            .toList();
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "More",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: article.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(article[index].urlToImage),
                      SizedBox(height: 8.0),
                      Text(
                        article[index].title,
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(article[index].description),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}