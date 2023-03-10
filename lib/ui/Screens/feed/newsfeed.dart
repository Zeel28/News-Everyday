import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_everyday/model/article_model.dart';
import 'package:news_everyday/ui/Screens/feed/widget/NewsContainer.dart';
import 'package:news_everyday/ui/Screens/feed/widget/my_floating_actionbutton.dart';
import 'package:news_everyday/utils/message.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../services/fetch_news.dart';
import '../../theme/colors.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  int _currentPage = 0;
  final _random = Random();
  List<Articles> newsFeedArticle = [];

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    final sourceId = FetchNews.sourcesId[_random.nextInt(FetchNews.sourcesId.length)];
    final articles = await NewsApi.fetchTopHeadlines(sourceId);
    setState(() {
      newsFeedArticle = articles;
    });
  }
  Future<void> _handleRefresh() async {
    return await _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {

    if (newsFeedArticle.isEmpty) {
      return Center(
        child: MessageDialog().progressIndicator(context)
      );
    }

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
                  String email =
                      Uri.encodeComponent("info.newseveryday@gmail.com");
                  String subject =
                      Uri.encodeComponent("Report a News *${newsFeedArticle[_currentPage].title}*");
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
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: primaryColor,
        height: 150,
        animSpeedFactor: 2,
        backgroundColor: primaryLightColor,
        showChildOpacityTransition: false,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: newsFeedArticle.length,
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          itemBuilder: (context, index) {
              return NewsContainer(
                article: newsFeedArticle[index]
              );
            }
        ),
      ),
      floatingActionButton: MyFloatingActionButton(article: newsFeedArticle[_currentPage],)
    );
  }
}
