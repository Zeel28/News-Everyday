import 'package:flutter/material.dart';
import 'package:news_everyday/theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 20,),
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
            ],
          ),
        ),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Menu.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5),
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
        );
      },
    );
  }
}
class FeedbackMenuList extends StatelessWidget {
  FeedbackMenuList({Key? key}) : super(key: key);

  final List<String> Menu = <String>[
    'Report a bug',
    'Send feedback',
  ];
  final List<String> leadingIcon = <String>[
    'bug.png',
    'feedback.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Menu.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5),
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
        );
      },
    );
  }
}