import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/article_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
import '../article_screen/article_screen.dart';

class CategoryScreen extends StatefulWidget {
  String title;

  CategoryScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Articles> categoryArticles = [];
  bool _isLoading = true;
  late String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadNews(widget.title);
  }

  Future<void> _loadNews(String category) async {
    final queryParameters = {
      'country': 'in',
      'category': category,
      'sortBy': 'publishedAt',
      'apiKey': '3f1a0e1381c74be2ab644cf747bfad83',
    };
    try {
      final article = await ApiService.fetchNews(queryParameters);
      setState(() {
        categoryArticles = article;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        categoryArticles = [];
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: Text(widget.title,
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
      ),
      body: _isLoading
          ? Center(child: MessageDialog().progressIndicator(context))
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryArticles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                            () => ArticleScreen(
                                  article: categoryArticles[index],
                                ),
                            duration: const Duration(milliseconds: 500),
                            transition: Transition.cupertinoDialog);
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: CachedNetworkImage(
                              imageUrl:  categoryArticles[index].urlToImage,
                              imageBuilder: (context, imageProvider) => Container(
                                height: 80,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  categoryArticles[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("2 hours ago",
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.visibility,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("100 views",
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
