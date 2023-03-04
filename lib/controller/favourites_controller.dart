import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_everyday/controller/userdata_controller.dart';
import '../model/article_model.dart';

class FavouritesController extends GetxController {
  List favourites = [];
  final profileController = Get.put(ProfileController());

  Future<void> addToFavourites(Articles article) async {
    favourites.add({'title': article.title});
    await FirebaseFirestore.instance
        .collection("usersInformation")
        .doc(profileController.userData!['id'])
        .collection("userData")
        .doc("favouritesNews")
        .set({"articles": favourites});
    update();
  }

  Future<void> removeFavourites(Articles article) async {
    favourites.removeLast();
    await FirebaseFirestore.instance
        .collection("usersInformation")
        .doc(profileController.userData!['id'])
        .collection("userData")
        .doc("favouritesNews")
        .set({"articles": favourites});
    // update();
  }

  bool isFavourite(Articles article) {
    return favourites.contains(article);
  }
}
// class FavouritesController extends GetxController {
//   // var favouritesList = [].obs;
//   List<Articles> favouritesList = [];
//   final profileController = Get.put(ProfileController());
//
//   // @override
//   // void onInit() {
//   //   super.onInit();
//   //   fetchFavourites();
//   // }
//   //
//   // void fetchFavourites() async {
//   //
//   //   try{
//   //     await FirebaseFirestore.instance
//   //         .collection("usersInformation")
//   //         .doc(profileController.userData!['id'])
//   //         .collection("userData")
//   //         .doc("favouritesNews")
//   //         .get();
//   //   }
//   //   catch(e){
//   //     print("----------$e");
//   //   }
//   //   // if (favourites.exists) {
//   //   //   favouritesList.value = favourites.data()!["articles"];
//   //   // }
//   // }
//
//   void addFavourite(Articles article) async {
//     favouritesList.add(article);
//     await FirebaseFirestore.instance
//         .collection("usersInformation")
//         .doc(profileController.userData!['id'])
//         .collection("userData")
//         .doc("favouritesNews")
//         .set({"articles": favouritesList});
//     update();
//     print("yes");
//   }
//   bool isFavourite(Articles article) {
//     return favouritesList.contains(article);
//   }
//   void removeFavourite(Articles article) async {
//     favouritesList.remove(article);
//     await FirebaseFirestore.instance
//         .collection("usersInformation")
//         .doc(profileController.userData!['id'])
//         .collection("userData")
//         .doc("favouritesNews")
//         .set({"articles": favouritesList});
//     update();
//     print("remove");
//   }
// }
