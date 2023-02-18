import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../authentication_pages/Login/login_screen.dart';
import '../../authentication_pages/Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Get.to(()=> const LoginScreen());
            },
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Get.to(()=> const SignUpScreen());
          },
          style: ElevatedButton.styleFrom(
              primary: primaryLightColor, elevation: 0),
          child: Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(color: Colors.black,fontSize: 16),
          ),
        ),
      ],
    );
  }
}
