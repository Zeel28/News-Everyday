import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/article_model.dart';

class FavoriteNewsService extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final RxList<Articles> favoriteNews = <Articles>[].obs;

  Future<void> addFavoriteNews(Articles article) async {
    try {
      await _db.collection('favorites').doc(article.title).set(article.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  // void fetchFavoriteNews() {
  //   try {
  //     _db.collection('favorites').snapshots().listen((snapshot) {
  //       favoriteNews.assignAll(snapshot.docs.map((doc) => Articles.fromJson(doc.data())).toList());
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  Stream<List<Articles>> getFavoriteNews() {
    try {
      return _db.collection('favorites').snapshots().map((snapshot) {
        List<Articles> articles = [];
        snapshot.docs.forEach((doc) {
          Articles article = Articles.fromJson(doc.data() as Map<String, dynamic>);
          articles.add(article);
        });
        return articles;
      });
    } catch (e) {
      print(e.toString());
      return Stream.empty();
    }
  }

  Future<void> removeFavoriteNews(Articles article) async {
    try {
      await _db.collection('favorites').doc(article.title).delete();
    } catch (e) {
      print(e.toString());
    }
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
