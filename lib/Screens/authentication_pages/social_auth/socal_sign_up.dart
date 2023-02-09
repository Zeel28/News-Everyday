import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_everyday/Screens/authentication_pages/phonenumber/verifty_otp.dart';
import 'package:news_everyday/firebase/auth_controller.dart';
import 'package:news_everyday/utils/message.dart';

import '../phonenumber/numeric_pad.dart';
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWithPhoneNumber(),
                    ));
              },
            ),
            SocalIcon(
              iconSrc: "assets/icons/facebook.svg",
              press: () {
                MessageDialog().alertDialog(context, "Coming Soon..", "This features under production", "Okay",() {
                  Navigator.pop(context);
                },);
              },
            ),
            SocalIcon(
              iconSrc: "assets/icons/apple.svg",
              press: () {
                MessageDialog().alertDialog(context, "Coming Soon..", "This features under production", "Okay",() {
                  Navigator.pop(context);
                },);
              },
            ),
            SocalIcon(
              iconSrc: "assets/icons/google.svg",
              press: () {
                SocialAuth().signInWithGoogle();
              },
            ),
          ],
        ),
      ],
    );
  }
}