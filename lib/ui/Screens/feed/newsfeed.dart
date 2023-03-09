import 'package:flutter/material.dart';
import 'package:news_everyday/model/article_model.dart';
import 'package:news_everyday/ui/Screens/feed/widget/NewsContainer.dart';
import 'package:news_everyday/ui/Screens/feed/widget/my_floating_actionbutton.dart';
import 'package:news_everyday/utils/message.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../services/api_service.dart';
import '../../../services/fetch_news.dart';
import '../../theme/colors.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  List<Articles> newsFeedArticle = [];
  bool _isLoading = true;
  late String? _errorMessage;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  final queryParameters = {
    'q': "google-news",
    'sortBy': "popularity,publishedAt",
    'language': 'en',
    'apiKey': '3f1a0e1381c74be2ab644cf747bfad83',
  };

  Future<void> _loadNews() async {
    try {
      final article = await ApiService.searchNews(queryParameters);
      setState(() {
        newsFeedArticle = article;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        newsFeedArticle = [];
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
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
                  String email =
                      Uri.encodeComponent("info.newseveryday@gmail.com");
                  String subject =
                      Uri.encodeComponent("Report a News ${newsFeedArticle[_currentPage].title}");
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
            _isLoading = true;
            _currentPage = value;
          });
          _loadNews();
        },
        itemBuilder: (context, index) {
          if (_isLoading) {
            return Center(child: MessageDialog().progressIndicator(context));
          } else {
            return NewsContainer(
              article: newsFeedArticle[index]
            );
          }
        },
      ),
      floatingActionButton: _isLoading ? null  : MyFloatingActionButton(article: newsFeedArticle[_currentPage],)
    );
  }
}
