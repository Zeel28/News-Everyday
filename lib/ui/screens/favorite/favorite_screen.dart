import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:news_everyday/ui/widgets/list_title/vertical_list_title.dart';
import 'package:news_everyday/utils/message.dart';
import '../../../controller/favourites_controller.dart';
import '../../../models/article_model.dart';
import '../../theme/colors.dart';

class FavoriteNewsScreen extends StatelessWidget {
  final FavoriteNewsService _favoriteNewsService = FavoriteNewsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Favourite News",
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
      ),
      body: StreamBuilder<List<Articles>>(
        stream: _favoriteNewsService.getFavoriteNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final favoriteNews = snapshot.data!;
            if (favoriteNews.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 170,
                        child: Lottie.asset("assets/lottiefile/bookmark.json",
                            fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Your Bookmark is empty!",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: darkBluishColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Save your favourite news here",
                        style: TextStyle(
                          color: darkBluishColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favoriteNews.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          flex: 2,
                          onPressed: (context) => _favoriteNewsService
                              .removeFavoriteNews(favoriteNews[index]),
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.delete_outline_outlined,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: VListTitle(article: favoriteNews[index]),
                  );
                },
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: MessageDialog().progressIndicator(context));
          }
        },
      ),
    );
  }
}
