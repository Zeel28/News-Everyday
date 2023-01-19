import 'package:flutter/material.dart';
import 'package:news_everyday/auth_controller.dart';
import 'package:news_everyday/theme/colors.dart';
import 'components/Gereral_section.dart';
import 'components/feedback_section.dart';
import 'components/logout.dart';
import 'components/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ProfileHeaderSection(),
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
          ),
        ),
      ),
    );
  }
}
