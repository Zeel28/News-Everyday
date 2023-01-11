import 'package:flutter/material.dart';
import 'package:news_everyday/theme/colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: press as void Function()?,
            child: Text(
              login ? "Don’t have an Account ? " : "Already have an Account ? ",
              style: const TextStyle(color: kPrimaryColor),
            ),
          ),
          GestureDetector(
            onTap: press as void Function()?,
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
