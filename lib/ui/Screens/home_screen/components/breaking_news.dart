import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/article_model.dart';
import '../../../../services/api_service.dart';
import '../../../../utils/message.dart';
import '../../../widgets/list_title/horizontal_list_tile.dart';
import '../../details_page/category_screen.dart';

class BreakingNews extends StatefulWidget {
  BreakingNews({
    super.key,
  });

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  List<Articles> finalArticles = [];
  bool _isLoading = true;
  late String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }
  final queryParameters = {
    'q' : "google-news",
    'sortBy': "popularity,publishedAt",
    'language': 'en',
    'apiKey': '3f1a0e1381c74be2ab644cf747bfad83',
  };
  Future<void> _loadNews() async {

    try {
      final article = await ApiService.searchNews(queryParameters);
      setState(() {
        finalArticles = article;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        finalArticles = [];
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
              InkWell(
                onTap: () => Get.to(() => CategoryScreen(
                  title: "Breaking News",keySearch: "q",searchValue: "Breaking News",
                )),
                child: Text(
                  "More",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 210,
            child: _isLoading
                ? Center(child: MessageDialog().progressIndicator(context))
                : _errorMessage != null
                    ? Center(child: Text(_errorMessage!))
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: finalArticles.length,
                        itemBuilder: (context, index) {
                          return HListTitle(article: finalArticles[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

