import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
  });

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
              CircleAvatar(minRadius: 37,),
              SizedBox(width: 20,),
              Column(
                children: [
                  Text("Zeel Bhanderi"),
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
              "zeelbhanderi28@gmail.com",
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