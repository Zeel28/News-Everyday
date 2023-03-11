import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_everyday/ui/Screens/home_screen/components/channels.dart';
import 'package:news_everyday/ui/Screens/notifications.dart';
import '../../../controller/userdata_controller.dart';
import '../../../model/article_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
import '../../widgets/list_title/vertical_list_title.dart';
import 'components/breakingnews.dart';
import 'components/header_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80',
      'https://images.unsplash.com/photo-1640184713838-032ed3562855?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1612872087720-bb876e2e67d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1607&q=80',
      'https://images.unsplash.com/photo-1576633587382-13ddf37b1fc1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80',
      'https://images.unsplash.com/photo-1494059980473-813e73ee784b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',
      'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80',
    ];
    final List<String> nameList = [
      'Business',
      'Entertainment',
      'Sports',
      'Technology',
      'General',
      'Health',
    ];
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(100, 90), //width and height
        child: SafeArea(
          child: Obx(() => profileController.userData!.isNotEmpty
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: profileController.userData!['photoURL'],
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ],
                        ),
                        child: IconButton(
                          onPressed: () =>
                              Get.to(() => const NotificationScreen()),
                          icon: const Icon(Icons.notifications_active,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                )
              : MessageDialog().progressIndicator(context)),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: primaryColor,
        height: 150,
        animSpeedFactor: 2,
        backgroundColor: primaryLightColor,
        showChildOpacityTransition: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            HeaderSlider(imgList: imgList, nameList: nameList),
            BreakingNews(),
            Channels(),
            RecommendedNews(),
          ],
        ),
      ),
    );
  }
}
class RecommendedNewsController extends GetxController {
  var finalArticles = <Articles>[].obs;
  var isLoading = true.obs;
  var errorMessage = RxnString();

  final queryParameters = {
    'q': "news",
    'sortBy': "popularity",
    'language': 'en',
    'apiKey': '3f1a0e1381c74be2ab644cf747bfad83',
  };

  @override
  void onInit() {
    super.onInit();
    _loadNews();
  }

  Future<void> _loadNews() async {
    try {
      final article = await ApiService.searchNews(queryParameters);
      finalArticles.assignAll(article);
      isLoading.value = false;
      errorMessage.value = null;
    } catch (e) {
      finalArticles.clear();
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
class RecommendedNews extends StatelessWidget {
  final recommendedNewsController = Get.put(RecommendedNewsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recommended News',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              if (recommendedNewsController.isLoading.value) {
                return CircularProgressIndicator();
              } else if (recommendedNewsController.errorMessage.value != null) {
                return Text('Error loading news');
              } else {
                return SizedBox(
                  height: double.maxFinite,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recommendedNewsController.finalArticles.length,
                    itemBuilder: (context, index) {
                      return VListTitle(article: recommendedNewsController.finalArticles[index]);
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
