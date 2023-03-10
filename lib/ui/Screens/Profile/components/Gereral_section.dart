import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_everyday/ui/Screens/Profile/components/screen.dart';
import '../../../../utils/message.dart';
import '../../../theme/colors.dart';
import '../../notifications.dart';
import '../pages/about_page.dart';
import '../pages/privacy_policy.dart';

class GeneralMenuList extends StatelessWidget {
  GeneralMenuList({Key? key}) : super(key: key);

  RxBool demo = false.obs;

  final List<String> menu = <String>[
    'Notification',
    'Dark Mode',
    'PrivacyPolicy',
    'Security',
    'About'
  ];
  final List<String> leadingIcon = <String>[
    'notification.png',
    'dark-mode.png',
    'privacy-policy.png',
    'security.png',
    'about.png'
  ];
  final List<Widget> action = <Widget>[
    const NotificationScreen(),
    NotificationScreen(),
    const PrivacyPolicy(),
    NotificationScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: menu.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(() => action[index]);
          },
          // onTap: () {
          //   menu[index] != 'Dark Mode'
          //       ? menu[index] == 'Notification'
          //           ? Get.to(() => const NotificationScreen())
          //           : MessageDialog().alertDialog(
          //               context,
          //               "Coming Soon..",
          //               "This features under production",
          //               "Okay",
          //               () {
          //                 Get.back();
          //               },
          //             )
          //       : demo.toggle();
          //   demo.isTrue;
          // },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 1.5,
                  spreadRadius: 1.5,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
            ),
            child: ListTile(
                tileColor: Colors.white,
                leading: Image.asset(
                    "assets/icons/profile_page/${leadingIcon[index]}",
                    height: 35,
                    width: 35),
                trailing: menu[index] != 'Dark Mode'
                    ? Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: primaryColor,
                      )
                    : Obx(() {
                        return demo.isTrue
                            ? Icon(
                                Icons.dark_mode_outlined,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.light_mode_outlined,
                                color: primaryColor,
                              );
                      }),
                title: Text(
                  menu[index],
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                )),
          ),
        );
      },
    );
  }
}
