import 'package:flutter/material.dart';
import 'package:news_everyday/theme/colors.dart';

class Forgot extends StatelessWidget {
  final bool login;
  final Function? press;
  const Forgot({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // GestureDetector(
          //   onTap: press as void Function()?,
          //   child: Text(
          //     login ? "" : "Already have an Account ? ",
          //     style: const TextStyle(color: primaryColor),
          //   ),
          // ),
          Spacer(),
          GestureDetector(
            onTap: press as void Function()?,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                login ? "Forgot your password?" : "Sign In",
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
