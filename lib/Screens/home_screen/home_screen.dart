import 'package:flutter/material.dart';
import 'package:news_everyday/Screens/Profile/Profile_page.dart';
import '../../api/model/article_model.dart';
import 'components/breakingnews.dart';
import 'components/channels.dart';
import 'components/newsofthday.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
          },
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          NewsOfTheDay(article: article),
          BreakingNews(
            articles: Article.articles,
          ),
          NewsChannels(
            articles: Article.articles,
          )
        ],
      ),
    );
  }
}



