import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_everyday/Screens/introduction_screens/onboarding_screen.dart';
import 'package:news_everyday/utils/message.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'firebase/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: App(),
      duration: 2500,
      imageSize: 600,
      imageSrc: "assets/images/logo.png",
      text: "By News Everyday ",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        fontFamily: "ODR",
        letterSpacing: 3,
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp().then((value) => Get.put(AuthController())),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            MessageDialog().snackbarGetCut("Error", "Something Went Wrong");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}