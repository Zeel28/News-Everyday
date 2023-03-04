import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_everyday/ui/theme/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/favourites_controller.dart';
import '../../../model/article_model.dart';
import '../../../utils/message.dart';
import '../webview/web_view.dart';

class ArticleScreen extends StatelessWidget {
  Articles article;
  ArticleScreen({Key? key, required this.article}) : super(key: key);

  final FavoriteNewsService _favoriteNewsService = Get.put(FavoriteNewsService());

  @override
  Widget build(BuildContext context) {
    RxBool pressedBool = false.obs;
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
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.more_horiz,
              color: primaryColor,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () async {
                  await Share.share(
                      'I saw this on the News Everyday and thought you should see it: ${article.title}   ${article.description}\n\n\n\n'
                          '* Disclaimer *  The News Everyday is not responsible for the content of this email, and anything written in this email does not necessarily reflect the News Everyday views or opinions. Please note that neither the email address nor name of the sender have been verified.',
                      subject:
                      'I saw this on the News Everyday and thought you should see it: ${article.title}');
                },
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.share,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Share",
                      style: TextStyle(color: primaryColor),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () async {
                  String email = Uri.encodeComponent("info.newseveryday@gmail.com");
                  String subject = Uri.encodeComponent("Report a News ${article.title}");
                  Uri mail = Uri.parse("mailto:$email?subject=$subject");
                  if (await launchUrl(mail)) {
                    //email app opened
                  }else{
                    MessageDialog().snackBarGetCut("Email App not found!", " Email id : info.newseveryday@gmail.com");
                  }
                },
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.report_gmailerrorred,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Report",
                      style: TextStyle(color: primaryColor),
                    )
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 50),
          ),
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
              Text(
                article.description,
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
                  Get.to(WebViewApp(url: article.url));
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
                pressedBool.toggle();
                if(pressedBool.isTrue){
                  _favoriteNewsService.addFavoriteNews(article);
                  MessageDialog().snackBarGetCut("Your News is saved",
                              "when you're ready to read this saved News, just tap on Saved News in the Menu bar",
                              backgroundColor: Colors.green);
                }else{
                  _favoriteNewsService.removeFavoriteNews(article);
                  MessageDialog().snackBarGetCut("Remove News", "",);
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                  return null;
                }),
              ),
              child: Obx(() {
                return pressedBool.isTrue
                    ? Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                )
                    : Icon(
                  Icons.favorite_border_outlined,
                  color: primaryColor,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
