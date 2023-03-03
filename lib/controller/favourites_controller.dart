import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouritesController extends GetxController {
  var favouritesList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavourites();
  }

  void fetchFavourites() async {
    final user = "1"; // Replace with the user ID
    final favourites = await FirebaseFirestore.instance
        .collection("favourites")
        .doc(user)
        .get();
    if (favourites.exists) {
      favouritesList.value = favourites.data()!["articles"];
    }
  }

  void addFavourite(article) async {
    final user = "1"; // Replace with the user ID
    favouritesList.add(article);
    await FirebaseFirestore.instance
        .collection("favouritesNews")
        .doc(user)
        .set({"articles": favouritesList});
  }

  void removeFavourite(article) async {
    final user = "1"; // Replace with the user ID
    favouritesList.remove(article);
    await FirebaseFirestore.instance
        .collection("favourites")
        .doc(user)
        .set({"articles": favouritesList});
  }
}