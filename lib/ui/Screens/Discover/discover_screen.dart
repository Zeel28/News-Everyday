import 'package:flutter/material.dart';
import '../../../model/article_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
import '../../widgets/list_title/vertical_list_title.dart';
import 'components/DiscoverNews.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {

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
    try {
      final article = await ApiService.searchNews(category);
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
                      ? Center(
                          child: MessageDialog().progressIndicator(context))
                      : _errorMessage != null
                          ? Center(child: Text(_errorMessage!))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: categoryArticles.length,
                              itemBuilder: (context, index) {
                                return VListTitle(demo: categoryArticles[index]);
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


