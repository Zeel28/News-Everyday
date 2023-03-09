import 'package:flutter/material.dart';
import 'package:news_everyday/model/article_model.dart';

import 'my_floating_actionbutton.dart';

class NewsContainer extends StatelessWidget {
  Articles article;

  NewsContainer({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.assetNetwork(
                  height: 300,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: "assets/images/splashscreen.gif",
                  image: article.urlToImage),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
              article.title,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          Text(article.description, style: TextStyle(fontSize: 12, color: Colors.black38)),
          Text(
            // newsCnt != "--"
            //     ? newsCnt.length > 350
            //         ? newsCnt.substring(0, 250)
            //         : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
            //     : newsCnt,
            article.content,
            style: TextStyle(fontSize: 16),
          ),
          // MyFloatingActionButton(
          //   article: article,
          // )
        ],
      )
    );
  }
}
