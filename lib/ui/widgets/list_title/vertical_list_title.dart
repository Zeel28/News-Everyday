import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/article_model.dart';
import '../../Screens/article_screen/article_screen.dart';
import '../image_container.dart';

class VListTitle extends StatelessWidget {
  const VListTitle({
    super.key,
    required this.article,
  });

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => ArticleScreen(
                  article: article,
                ),
            duration: const Duration(milliseconds: 500),
            transition: Transition.cupertinoDialog);
      },
      child: Row(
        children: [
          ImageContainer(
              width: 80,
              height: 80,
              margin: const EdgeInsets.all(10.0),
              boarderRadius: 5,
              imageUrl: article.urlToImage),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("2 hours ago",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall!),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.visibility,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("100 views", style: TextStyle(fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
