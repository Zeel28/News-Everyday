import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/article_model.dart';
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

  Future<void> _loadNews() async {
    try {
      final article = await ApiService.searchNews("news");
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
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => Get.to(CategoryScreen(
                  title: "Breaking News",
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
            height: 220,
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

