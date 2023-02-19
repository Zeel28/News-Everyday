import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_everyday/ui/theme/colors.dart';
import 'package:news_everyday/ui/widgets/custom_tag.dart';
import '../../../api/model/article_model.dart';
import '../webview/web_view.dart';

class ArticleScreen extends StatelessWidget {
  Articles article;

  ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: primaryColor,
            ),
          )
        ],
      ),
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
                      image: NetworkImage(article.urlToImage),
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
              Row(
                children: [
                  CustomTag(backgroundColor: primaryColor, children: [
                    const Icon(
                      Icons.timer_sharp,
                      color: primaryLightColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(article.publishedAt,
                        style: TextStyle(color: primaryLightColor)),
                  ]),
                  const SizedBox(
                    width: 10,
                  ),
                  const CustomTag(
                      backgroundColor: primaryLightColor, children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("67", style: TextStyle(color: primaryColor)),
                  ]),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                article.title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(article.description, style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),),
              // Spacer(),
              Text(" Url ${article.url}"),
              ElevatedButton(onPressed: () {
                Get.to(WebViewApp(url: article.url));
              }, child: const Text("Read more"))
            ],
          ),
        ),
      ),
    );
  }
}
