import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../api/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../widgets/image_container.dart';

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
    Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3f1a0e1381c74be2ab644cf747bfad83"));

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
              scrollDirection: Axis.horizontal,
              itemCount: article.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ImageContainer(
                          width: MediaQuery.of(context).size.width * 0.5,
                          imageUrl: article[index].urlToImage),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(article[index].title,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                              fontWeight: FontWeight.bold, height: 1.5)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          "${article[index].publishedAt.substring(0, 10)} ago",
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodySmall!),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // Text("by ${articles[index].author}",
                      //     maxLines: 2,
                      //     style: Theme.of(context).textTheme.bodySmall!),
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