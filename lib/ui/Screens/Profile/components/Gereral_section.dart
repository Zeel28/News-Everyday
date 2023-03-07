import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_everyday/ui/Screens/Profile/components/screen.dart';
import '../../../theme/colors.dart';

class GeneralMenuList extends StatelessWidget {
  GeneralMenuList({Key? key}) : super(key: key);

  RxBool demo = false.obs;

  final List<String> menu = <String>[
    'Account',
    'Notification',
    'Dark Mode',
    'PrivacyPolicy',
    'Security',
    'About'
  ];
  final List<String> leadingIcon = <String>[
    'account.png',
    'notification.png',
    'dark-mode.png',
    'privacy-policy.png',
    'security.png',
    'about.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //You can make the ListView widget never scrollable by setting physics property to NeverScrollableScrollPhysics().
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: menu.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () { menu[index]!= 'Dark Mode' ?  Get.to(() =>SettingOptionScreen(appBarTitle: menu[index],)) : demo.toggle();demo.isTrue;},
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
                trailing: menu[index]!= 'Dark Mode' ?   Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: primaryColor,
                ) : Obx(() {
                  return demo.isTrue
                      ? Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.redAccent,
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
