import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_everyday/controller/userdata_controller.dart';

class FavouritesController extends GetxController {
  var favouritesList = [].obs;
  final profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
    fetchFavourites();
  }

  void fetchFavourites() async {

    final favourites = await FirebaseFirestore.instance
        .collection("usersInformation")
        .doc(profileController.userData!['id'])
        .collection("userData")
        .doc("favouritesNews")
        .get();
    if (favourites.exists) {
      favouritesList.value = favourites.data()!["articles"];
    }
  }

  void addFavourite(article) async {
    favouritesList.add(article);
    await FirebaseFirestore.instance
        .collection("usersInformation")
        .doc(profileController.userData!['id'])
        .collection("userData")
        .doc("favouritesNews")
        .set({"articles": favouritesList});
  }

  void removeFavourite(article) async {
    favouritesList.remove(article);
    await FirebaseFirestore.instance
        .collection("usersInformation")
        .doc(profileController.userData!['id'])
        .collection("userData")
        .doc("favouritesNews")
        .set({"articles": favouritesList});
  }
}