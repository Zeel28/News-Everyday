import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/article_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
import '../../widgets/image_container.dart';
import '../article_screen/article_screen.dart';
import 'components/DiscoverNews.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> category = [
      'Business',
      'Entertainment',
      'General',
      'Science',
      'Sports',
      'Technology'
    ];

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            DiscoverNews(),
          ],
        ),
    );
  }
}

class _CategoryNews extends StatefulWidget {
  const _CategoryNews({
    Key? key,
    required this.category,
    required this.categoryData,
  }) : super(key: key);

  final List<String> category;
  final List<String> categoryData;

  @override
  State<_CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<_CategoryNews> {
  List<Articles> categoryArticles = [];
  bool _isLoading = true;
  late String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadNews("business");
  }

  Future<void> _loadNews(String category) async {
    final queryParameters = {
      'country': 'in',
      'category': category,
      'sortBy': 'publishedAt',
      'apiKey': '9f6d210f572a43c2892e84040a32e190',
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
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          onTap: (value) {
            _loadNews(widget.category[value]);
          },
          indicatorColor: Colors.black,
          tabs: widget.category
              .map((tab) => Tab(
                    icon: Text(
                      tab,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ))
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: widget.categoryData
                .map(
                  (tab2) => _isLoading
                      ?  Center(child: MessageDialog().progressIndicator(context))
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
                                        duration:
                                            const Duration(milliseconds: 500),
                                        transition: Transition.cupertinoDialog);
                                  },
                                  child: Row(
                                    children: [
                                      ImageContainer(
                                          width: 80,
                                          height: 80,
                                          margin: const EdgeInsets.all(10.0),
                                          boarderRadius: 5,
                                          imageUrl: categoryArticles[index]
                                              .urlToImage),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              categoryArticles[index].title,
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                    style: TextStyle(
                                                        fontSize: 12)),
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
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
