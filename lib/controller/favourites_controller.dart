import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_everyday/controller/userdata_controller.dart';
import 'package:news_everyday/utils/message.dart';
import '../models/article_model.dart';

class FavoriteNewsService extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final RxList<Articles> favoriteNews = <Articles>[].obs;
  final profileController = Get.put(ProfileController());

  Future<void> addFavoriteNews(Articles article) async {
    try {
      await _db.collection('usersInformation').doc(profileController.userData!['id']).collection("favouritesNews").doc(article.title).set(article.toJson());
    } catch (e) {
      MessageDialog().snackBarGetCut("This News are not bookmark", "Please try again or later");
    }
  }

  Stream<List<Articles>> getFavoriteNews() {
    try {
      return _db.collection('usersInformation').doc(profileController.userData!['id']).collection('favouritesNews').snapshots().map((snapshot) {
        List<Articles> articles = [];
        for (var doc in snapshot.docs) {
          Articles article = Articles.fromJson(doc.data());
          articles.add(article);
        }
        return articles;
      });
    } catch (e) {
      return const Stream.empty();
    }
  }

  Future<void> removeFavoriteNews(Articles article) async {
    try {
      await _db.collection('usersInformation').doc(profileController.userData!['id']).collection("favouritesNews").doc(article.title).delete();
    } catch (e) {
      MessageDialog().snackBarGetCut("This News are not remove bookmark", "Please try again or later");
    }
  }
}