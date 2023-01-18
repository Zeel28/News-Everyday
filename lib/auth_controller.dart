import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_everyday/Screens/Home/Home_page.dart';
import 'package:news_everyday/utils/message.dart';

import 'Screens/introduction_screens/onboarding_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }


  _initialScreen(User? user) async {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => const OnBoardingScreen2());
    } else {
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;
      print("{$name and $email and }");
      Get.offAll(() => HomePage());
    }
  }

  Future<void> signUp(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MessageDialog().snackbarGetCut(
            "Account creation failed", "Please enter Strong Password");
      } else if (e.code == 'email-already-in-use') {
        MessageDialog().snackbarGetCut("Account creation failed",
            "The account already exists for that email.");
      }
    } catch (e) {
      MessageDialog().snackbarGetCut("Account creation failed", "");
    }
  }


  Future<void> signIn(String email, password, context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MessageDialog().snackbarGetCut(
            "Login Failed", "Check your email or create an account.");
      } else if (e.code == 'wrong-password') {
        MessageDialog().snackbarGetCut("Login Failed", "Wrong password ");
      }
    } catch (e) {
      MessageDialog().snackbarGetCut("Login Failed", "");
    }
  }

  //TODO: Sign out
  Future<void> loginOut() async {
    await auth.signOut();
  }
}
class SocialAuth{
  //TODO: Google SignIn
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}