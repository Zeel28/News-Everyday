import 'package:flutter/material.dart';
import '../../../../services/fetch_news.dart';
import '../../../../model/article_model.dart';
import '../../../../utils/message.dart';
import '../../../theme/colors.dart';
import 'widget/NewsContainer.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  bool isLoading = true;
  late Articles newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
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
            return isLoading ?  Center(child: MessageDialog().progressIndicator(context),): FeedPage(
              imageUrl: newsArt.urlToImage,
              newsHeand: newsArt.title,
              newsDec: newsArt.description,
              newsCnt: newsArt.content,
              newsUrl: newsArt.url,
            );
          },
        ));
  }
}
