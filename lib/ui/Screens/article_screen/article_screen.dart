import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_everyday/ui/theme/colors.dart';
import '../../../controller/favourites_controller.dart';
import '../../../model/article_model.dart';
import '../webview/web_view.dart';
class ArticleScreen extends StatefulWidget {
  Articles article;
  ArticleScreen({Key? key, required this.article});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {

  final FavoriteNewsService _favoriteNewsService = Get.put(FavoriteNewsService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(widget.article.urlToImage),
                      fit: BoxFit.cover),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.article.title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.article.description,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(WebViewApp(url: widget.article.url));
                },
                child: const Text(
                  'Read more',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                _favoriteNewsService.addFavoriteNews(widget.article);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                  return null;
                }),
              ),
              child: const Icon(
                Icons.favorite_border_outlined,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
