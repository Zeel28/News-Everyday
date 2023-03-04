import 'package:flutter/material.dart';
import '../../../controller/favourites_controller.dart';
import 'package:get/get.dart';
class FavouriteScreen extends StatelessWidget {
  final FavouritesController favouritesController = Get.put(FavouritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
      ),
      // body: Obx(() {
      //   if (favouritesController.favouritesList.isEmpty) {
      //     return Center(
      //       child: Text("You have no favourite articles"),
      //     );
      //   } else {
      //     return ListView.builder(
      //       itemCount: favouritesController.favouritesList.length,
      //       itemBuilder: (context, index) {
      //         final article = favouritesController.favouritesList[index];
      //         return ListTile(
      //           title: Text(article["title"] ?? ""),
      //           subtitle: Text(article["description"] ?? ""),
      //           trailing: IconButton(
      //             icon: Icon(Icons.delete),
      //             onPressed: () {
      //               favouritesController.removeFavourite(article);
      //             },
      //           ),
      //         );
      //       },
      //     );
      //   }
      // }),
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