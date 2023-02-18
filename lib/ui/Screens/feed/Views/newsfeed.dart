import 'package:flutter/material.dart';
import '../../../../api/controller/fetchNews.dart';
import '../../../../api/model/news_art.dart';
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
          elevation: 0,
          centerTitle: true,
          title: Text("fultter"),
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
            return isLoading ? Center(child: CircularProgressIndicator(),): NewsContainer(
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
