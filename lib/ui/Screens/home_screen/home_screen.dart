import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_everyday/ui/Screens/notifications.dart';
import '../../../controller/userData.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
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
                          onPressed: () => Get.to(const NotificationScreen()),
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
          children: [
            HeaderSlider(imgList: imgList, nameList: nameList),
            BreakingNews(),
            BreakingNews(),
          ],
        ),
      ),
    );
  }
}
