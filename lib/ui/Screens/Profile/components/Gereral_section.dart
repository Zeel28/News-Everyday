import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_everyday/utils/message.dart';

import '../../../theme/colors.dart';
import '../PrivacyPolicy.dart';
import '../Terms_and_conditions.dart';

class GeneralMenuList extends StatelessWidget {
  GeneralMenuList({Key? key}) : super(key: key);

  final List<String> Menu = <String>[
    'Account',
    'Notification',
    'Dark Mode',
    'Privacy Policy',
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
  static List<Widget> navigatepages = <Widget>[
    PrivacyPolicy(),
    PrivacyPolicy(),
    PrivacyPolicy(),
    PrivacyPolicy(),
    TermsAndConditions(),
    PrivacyPolicy(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //You can make the ListView widget never scrollable by setting physics property to NeverScrollableScrollPhysics().
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Menu.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Get.to(navigatepages[index]),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 2.0, // has the effect of softening the shadow
                  spreadRadius: 2.0, // has the effect of extending the shadow
                  offset: Offset(
                    5.0, // horizontal, move right 10
                    5.0, // vertical, move down 10
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
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: primaryColor,
                ),
                title: Text(
                  Menu[index],
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
