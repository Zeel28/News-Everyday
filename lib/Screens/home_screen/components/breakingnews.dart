import 'package:flutter/material.dart';

import '../../../api/model/article_model.dart';
import '../../../widgets/image_container.dart';
import '../../article_screen/article_screen.dart';

class BreakingNews extends StatefulWidget {
  BreakingNews({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {


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
              itemCount: widget.articles.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleScreen(
                              article: widget.articles[index],
                            ),
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.5,
                            imageUrl: widget.articles[index].imageUrl),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.articles[index].title,
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
                            "${DateTime.now().difference(widget.articles[index].createdAt).inHours} hours ago",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodySmall!),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("by ${widget.articles[index].author}",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodySmall!),
                      ],
                    ),
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