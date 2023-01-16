import 'package:flutter/material.dart';
import 'package:news_everyday/auth_controller.dart';
import 'package:news_everyday/utils/message.dart';

import 'or_divider.dart';
import 'social_icon.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: "assets/icons/call.svg",
              press: () {
                MessageDialog().alertDialog(context, "Coming Soon..", "This features under production", "Okay");
              },
            ),
            SocalIcon(
              iconSrc: "assets/icons/facebook.svg",
              press: () {
                MessageDialog().alertDialog(context, "Coming Soon..", "This features under production", "Okay");
              },
            ),
            SocalIcon(
              iconSrc: "assets/icons/apple.svg",
              press: () {
                MessageDialog().alertDialog(context, "Coming Soon..", "This features under production", "Okay");
              },
            ),
            SocalIcon(
              iconSrc: "assets/icons/google.svg",
              press: () {
                AuthController().signInWithGoogle();
              },
            ),
          ],
        ),
      ],
    );
  }
}