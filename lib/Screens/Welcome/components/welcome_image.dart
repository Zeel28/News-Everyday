import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 50,bottom: 5),
          child: const Text(
            "WELCOME TO ",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black45),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50,bottom: 25),
          child: const Text(
            "NEWS EVERYDAY",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33,color: primaryColor),
          ),
        ),
        SizedBox(height: defaultPadding * 4),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset("assets/images/welcome.jpg"),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}