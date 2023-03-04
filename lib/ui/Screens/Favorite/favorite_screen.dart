import 'package:flutter/material.dart';
import '../../../controller/favourites_controller.dart';
import 'package:get/get.dart';

import '../../../model/article_model.dart';
class FavoriteNewsScreen extends StatelessWidget {
  final FavoriteNewsService _favoriteNewsService = FavoriteNewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite News'),
      ),
      body: StreamBuilder<List<Articles>>(
        stream: _favoriteNewsService.getFavoriteNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final favoriteNews = snapshot.data!;
            return ListView.builder(
              itemCount: favoriteNews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteNews[index].title),
                  subtitle: Text(favoriteNews[index].description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _favoriteNewsService.removeFavoriteNews(favoriteNews[index]);
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//
//         centerTitle: true,
//         title: const Text("Favorite",
//             style: TextStyle(color: primaryColor, letterSpacing: 1)),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "Clear All",
//                 style: TextStyle(color: primaryColor),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 170,
//                 child: Lottie.asset("assets/lottiefile/bookmark.json",
//                     fit: BoxFit.fill),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Your Bookmark is empty!",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 22,
//                     color: darkBluishColor),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Save your favourite news here",
//                 style: TextStyle(color: darkBluishColor,fontSize: 15,),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }