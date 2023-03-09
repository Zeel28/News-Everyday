import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/article_model.dart';
import '../../Screens/article_screen/article_screen.dart';

class HListTitle extends StatelessWidget {
  const HListTitle({
    super.key,
    required this.article,
  });

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 6, bottom: 6, left: 6),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
      child: InkWell(
        onTap: () {
          Get.to(
              () => ArticleScreen(
                    article: article,
                  ),
              duration: const Duration(milliseconds: 500),
              //duration of transitions, default 1 sec
              transition: Transition.cupertinoDialog);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 115,
                fit: BoxFit.cover,
                imageUrl: article.urlToImage),
            const SizedBox(
              height: 10,
            ),
            Text(article.title,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, height: 1.5)),
            const SizedBox(
              height: 5,
            ),
            Text("${article.publishedAt.substring(0, 10)} ago",
                maxLines: 2, style: Theme.of(context).textTheme.bodySmall!),
          ],
        ),
      ),
    );
  }
}
