import 'package:flutter/material.dart';
import '../../../../theme/colors.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 75,top: 30),
          child: const Text(
            "Signup",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: primaryColor),
          ),
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            Expanded(
              // flex: 6,
              child: Image.asset("assets/images/signup_signuppage.png"),
            ),
          ],
        ),
      ],
    );
  }
}
