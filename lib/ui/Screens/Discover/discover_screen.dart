import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../model/article_model.dart';
import '../../../services/api_service.dart';
import '../../theme/colors.dart';
import '../../widgets/custom_tag.dart';
import '../../widgets/image_container.dart';
import '../article_screen/article_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

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
    List<String> categoryData = ['1', '2', '3', '4', '5', '6'];

    return DefaultTabController(
      initialIndex: 0,
      length: category.length,
      child: Scaffold(
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
          padding: const EdgeInsets.all(20.0),
          children: [
            _DiscoverNews(),
            _CategoryNews(
              category: category,
              categoryData: categoryData,
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryNews extends StatefulWidget {
  _CategoryNews({
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
                      ? const Center(child: CircularProgressIndicator())
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

class _DiscoverNews extends StatefulWidget {

  const _DiscoverNews({
    super.key,

  });

  @override
  State<_DiscoverNews> createState() => _DiscoverNewsState();
}

class _DiscoverNewsState extends State<_DiscoverNews> {

  final TextEditingController _searchWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Discover',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 5,
          ),
          Text('News from all over the world',
              style: Theme.of(context).textTheme.bodySmall!),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _searchWord,
            decoration: InputDecoration(
                hintText: "Search",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                // suffixIcon: RotatedBox(
                //   quarterTurns: 1,
                //   child: IconButton(
                //     onPressed: () {
                //       BottomSheet(context,widget.category);
                //     },
                //     icon: const Icon(
                //       Icons.tune,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }

  // Future<dynamic> BottomSheet(BuildContext context,category) {
  //   List<String> language = [
  //     'English',
  //     'French',
  //     'Arabic',
  //     'German',
  //     'Hebrew',
  //     'Italian',
  //     'Dutch / Flemish',
  //     'Swedish',
  //     'Chinese',
  //   ];
  //   int _selected = 0;
  //   int _selectedCategory = 0;
  //
  //   return showModalBottomSheet(
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(20),
  //       ),
  //     ),
  //     clipBehavior: Clip.antiAliasWithSaveLayer,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) => SizedBox(
  //           height: double.maxFinite,
  //           child: Container(
  //             color: Colors.white,
  //             padding: const EdgeInsets.all(15),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: <Widget>[
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     const Text('Filter',
  //                         style: TextStyle(
  //                             fontSize: 24, fontWeight: FontWeight.w600)),
  //                     CustomTag(
  //                         backgroundColor: Colors.grey.shade200,
  //                         children: [Text(" Done ")])
  //                   ],
  //                 ),
  //                 Divider(color: Colors.grey.shade300, thickness: 1.5),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Row(
  //                   children: const [
  //                     Text('Category',
  //                         style: TextStyle(
  //                             fontSize: 18, fontWeight: FontWeight.w300)),
  //                     Spacer(),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Wrap(
  //                   runSpacing: 5.0,
  //                   spacing: 5.0,
  //                   children: List.generate(category.length, (index) {
  //                     return InkWell(
  //                       onTap: () {
  //                         setState(() {
  //                           _selectedCategory = index;
  //                         });
  //                       },
  //                       child: CustomTag(
  //                           backgroundColor: _selectedCategory == index
  //                               ? primaryColor
  //                               : primaryLightColor,
  //                           children: [
  //                             Text(
  //                               category[index],
  //                               style: TextStyle(
  //                                   color: _selectedCategory == index
  //                                       ? primaryLightBackgroundColor
  //                                       : primaryColor),
  //                             ),
  //                           ]),
  //                     );
  //                   }),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 Row(
  //                   children: const [
  //                     Text('Language',
  //                         style: TextStyle(
  //                             fontSize: 18, fontWeight: FontWeight.w300)),
  //                     Spacer(),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Wrap(
  //                   runSpacing: 5.0,
  //                   spacing: 5.0,
  //                   children: List.generate(language.length, (index) {
  //                     return InkWell(
  //                       onTap: () {
  //                         setState(() {
  //                           _selected = index;
  //                         });
  //                       },
  //                       child: CustomTag(
  //                           backgroundColor: _selected == index
  //                               ? primaryColor
  //                               : primaryLightColor,
  //                           children: [
  //                             Text(
  //                               language[index],
  //                               style: TextStyle(
  //                                   color: _selected == index
  //                                       ? primaryLightBackgroundColor
  //                                       : primaryColor),
  //                             ),
  //                           ]),
  //                     );
  //                   }),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
