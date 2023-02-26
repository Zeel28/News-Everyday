import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/userData.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
import 'components/Gereral_section.dart';
import 'components/feedback_section.dart';
import 'components/logout.dart';
import 'components/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => profileController.userData!.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileCard(userData: profileController.userData!),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Gereral".toUpperCase(),
                            style: const TextStyle(
                                color: primaryColor,
                                letterSpacing: 5,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                        GeneralMenuList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "feedback".toUpperCase(),
                            style: const TextStyle(
                                color: primaryColor,
                                letterSpacing: 5,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                        FeedbackMenuList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "logout".toUpperCase(),
                            style: const TextStyle(
                                color: primaryColor,
                                letterSpacing: 5,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const LogoutButton()
                      ],
                    ),
                  )
                : Center(
                    child: MessageDialog().progressIndicator(context),
                  ),
          ),
        ),
      ),
    );
  }
}
