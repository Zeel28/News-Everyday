import 'package:flutter/material.dart';
import '../../../api/model/article_model.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({Key? key, required this.article}) : super(key: key);

  Articles article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Title :${article.title}"),
              SizedBox(
                height: 10,
              ),
              Text(" Description ${article.description}"),
              SizedBox(
                height: 10,
              ),
              Text(" Content ${article.content}"),
              SizedBox(
                height: 10,
              ),
              Text("Publish At : ${article.publishedAt}"),
              SizedBox(
                height: 10,
              ),
              Text(" Url ${article.url}"),
              SizedBox(
                height: 10,
              ),
              Image.network(article.urlToImage),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
