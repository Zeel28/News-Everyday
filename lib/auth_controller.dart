import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_everyday/Screens/Home/Home_page.dart';
import 'package:news_everyday/Screens/Welcome/welcome_screen.dart';


class AuthController extends GetxController {
  //AuthController.instance
  static AuthController instance = Get.find();

  //variable
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance; // lots of pro use for fiebase

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => WelcomeScreen());
    } else {
      Get.offAll(() => HomePage(email:user.email));
    }
  }

  Future<void> register(String email, password) async {
    try {
    await  auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
              "Account creation failed", style: TextStyle(color: Colors.white)),
          messageText: Text(
            "e.toString", style: TextStyle(color: Colors.white),)

      );
    }
  }
  Future<void> login(String email, password) async {
    try {
      await  auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
              "Login Failed", style: TextStyle(color: Colors.white)),
          messageText: Text(
            "e.toString", style: TextStyle(color: Colors.white),)

      );
    }
  }
  Future<void> loginOut()
  async {
    await auth.signOut();
  }
}