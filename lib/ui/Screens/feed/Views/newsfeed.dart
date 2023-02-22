import 'package:flutter/material.dart';
import '../../../../api/controller/fetchNews.dart';
import '../../../../model/news_art.dart';
import '../../../theme/colors.dart';
import 'widget/NewsContainer.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  bool isLoading = true;
  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
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
            GetNews();
          },
          itemBuilder: (context, index) {
            return isLoading ? const Center(child: CircularProgressIndicator(),): FeedPage(
              imageUrl: newsArt.imagUrl,
              newsHeand: newsArt.newsHead,
              newsDec: newsArt.newsDes,
              newsCnt: newsArt.newsCnt,
              newsUrl: newsArt.newsUrl,
            );
          },
        ));
  }
}
