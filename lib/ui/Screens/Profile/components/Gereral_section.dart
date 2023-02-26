import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../pages/privacy_policy.dart';
import '../pages/terms_and_conditions.dart';

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
