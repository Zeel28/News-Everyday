import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
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
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: kPrimaryColor),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: Image.asset("assets/images/signin_loginpage.png"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 0.5),
      ],
    );
  }
}