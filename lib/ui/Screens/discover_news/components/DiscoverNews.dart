import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:news_everyday/ui/theme/colors.dart';
import 'package:news_everyday/ui/widgets/custom_tag.dart';
import 'package:news_everyday/ui/widgets/list_title/vertical_list_title.dart';
import 'package:news_everyday/utils/message.dart';
import '../../../../model/article_model.dart';
import '../../../../services/api_service.dart';
import '../../article_screen/article_screen.dart';

class DiscoverNews extends StatefulWidget {
  const DiscoverNews({
    super.key,
  });

  @override
  State<DiscoverNews> createState() => _DiscoverNewsState();
}

class _DiscoverNewsState extends State<DiscoverNews> {
  final TextEditingController _searchWord = TextEditingController();
  List<Articles> _articles = [];

  void _searchNews(String query) async {
    final queryParameters = {
      'q': query,
      'sortBy': "relevancy",
      'sortBy': 'popularity',
      'sortBy': 'publishedAt',
      'language': 'en',
      'apiKey': '459f208e91ae40e3a7f6477321f9e61e',
    };
    final articles = await ApiService.searchNews(queryParameters);
    setState(() {
      _articles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Discover',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Text('News from all over the world',
                    style: Theme.of(context).textTheme.bodySmall!),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _searchWord,
                  onFieldSubmitted: (value) {
                    _searchNews(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: double.maxFinite,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                return VListTitle(article: _articles[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
