import 'package:flutter/material.dart';
import 'package:news_everyday/model/article_model.dart';
import 'package:news_everyday/ui/Screens/feed/widget/NewsContainer.dart';
import 'package:news_everyday/ui/Screens/feed/widget/my_floating_actionbutton.dart';
import 'package:news_everyday/utils/message.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../services/fetch_news.dart';
import '../../theme/colors.dart';
class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  bool isLoading = true;


  Articles? newsFeedArticle;
  getNews() async {
    newsFeedArticle = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Feed News",
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
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
                      'I saw this on the News Everyday and thought you should see it :-  ${newsFeedArticle!.title}   ${newsFeedArticle!.description}\n\n\n\n'
                      '* Disclaimer *  The News Everyday is not responsible for the content of this email, and anything written in this email does not necessarily reflect the News Everyday views or opinions. Please note that neither the email address nor name of the sender have been verified.',
                      subject:
                          'I saw this on the News Everyday and thought you should see it: ${newsFeedArticle!.title}');
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
                  String email =
                      Uri.encodeComponent("info.newseveryday@gmail.com");
                  String subject =
                      Uri.encodeComponent("Report a News ${newsFeedArticle!.title}");
                  Uri mail = Uri.parse("mailto:$email?subject=$subject");
                  if (await launchUrl(mail)) {
                    //email app opened
                  } else {
                    MessageDialog().snackBarGetCut("Email App not found!",
                        " Email id : info.newseveryday@gmail.com");
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
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            isLoading = true;
          });
          getNews();
        },
        itemBuilder: (context, index) {
          return isLoading
              ? Center(child: MessageDialog().progressIndicator(context))
              : NewsContainer(
                  imageUrl: newsFeedArticle!.urlToImage,
                  newsHeand: newsFeedArticle!.title,
                  newsDec: newsFeedArticle!.description,
                  newsCnt: newsFeedArticle!.content,
                  newsUrl: newsFeedArticle!.url,
                );
        },
      ),
      floatingActionButton: MyFloatingActionButton(article: newsFeedArticle!),
      );
  }
}
