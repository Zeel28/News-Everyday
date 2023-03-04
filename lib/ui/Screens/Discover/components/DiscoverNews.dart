import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:news_everyday/ui/theme/colors.dart';
import 'package:news_everyday/ui/widgets/custom_tag.dart';
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
    final articles = await ApiService.searchNews(query);
    setState(() {
      _articles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  // onTap: () => Get.to(SearchBar()),
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
                final article = _articles[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  padding: EdgeInsets.all(5),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                      )
                    ],
                  ),
                  child: InkWell(
                    onTap: () => Get.to(
                        () => ArticleScreen(
                              article: _articles[index],
                            ),
                        duration: const Duration(milliseconds: 500),
                        //duration of transitions, default 1 sec
                        transition: Transition.cupertinoDialog),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(article.urlToImage),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Text("${article.title}..",
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5)),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    CustomTag(backgroundColor: primaryLightBackgroundColor, children: [
                                      const Icon(
                                        Icons.timer_sharp,
                                        color: primaryColor,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 5,),
                                      Text(article.publishedAt,
                                          style: const TextStyle(fontSize: 12,color: primaryColor)),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          )
        ],
      ),
    );
  }
}


