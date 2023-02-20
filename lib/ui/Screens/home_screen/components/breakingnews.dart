import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../api/model/article_model.dart';
import '../../../../services/api_service.dart';
import '../../../widgets/image_container.dart';
import '../../article_screen/article_screen.dart';

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
      final article = await ApiService.fetchNews();
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

  late final List<Article> articles;

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
              Text(
                "More",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 220,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null
                    ? Center(child: Text(_errorMessage!))
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: finalArticles.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                            width: MediaQuery.of(context).size.width * 0.6,
                            margin: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => ArticleScreen(
                                      article: finalArticles[index],
                                    ), duration: const Duration(milliseconds: 500), //duration of transitions, default 1 sec
                                    transition: Transition.cupertinoDialog);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageContainer(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      imageUrl:
                                          finalArticles[index].urlToImage),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(finalArticles[index].title,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              height: 1.5)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "${finalArticles[index].publishedAt.substring(0, 10)} ago",
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            // child: FutureBuilder<List<Articles>>(
            //   future: ApiService.fetchNews(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: snapshot.data?.length,
            //         itemBuilder: (context, index) {
            //           final article = snapshot.data![index];
            //           return Container(
            //             width: MediaQuery.of(context).size.width * 0.5,
            //             margin: const EdgeInsets.only(right: 10),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 ImageContainer(
            //                     width: MediaQuery.of(context).size.width * 0.5,
            //                     imageUrl: snapshot.data![index].urlToImage),
            //                 const SizedBox(
            //                   height: 10,
            //                 ),
            //                 Text(snapshot.data![index].title,
            //                     maxLines: 2,
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .bodyLarge!
            //                         .copyWith(
            //                             fontWeight: FontWeight.bold,
            //                             height: 1.5)),
            //                 const SizedBox(
            //                   height: 5,
            //                 ),
            //                 Text(
            //                     "${snapshot.data![index].publishedAt.substring(0, 10)} ago",
            //                     maxLines: 2,
            //                     style: Theme.of(context).textTheme.bodySmall!),
            //               ],
            //             ),
            //           );
            //         },
            //       );
            //     } else if (snapshot.hasError) {
            //       return Center(
            //         child: Text('${snapshot.error}'),
            //       );
            //     }
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            // ),
          ),

        ],
      ),
    );
  }
}
