import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_everyday/Screens/Home/Home_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../theme/colors.dart';

class ProfileHeaderSection extends StatelessWidget {
   ProfileHeaderSection({
    super.key,
  });


  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(minRadius: 37,backgroundImage: NetworkImage(user!.photoURL.toString()),),
              SizedBox(width: 20,),
              Column(
                children: [
                  Text(user!.displayName.toString()),
                  Text("@zeel_bhander")
                ],
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text(
              "+91 8160146729",
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.mail_rounded),
            title: Text(
              user!.email.toString(),
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}