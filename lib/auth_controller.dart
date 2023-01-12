import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:news_everyday/Screens/Home/Home_page.dart';
import 'package:news_everyday/Screens/Welcome/welcome_screen.dart';
import 'package:news_everyday/utils/message.dart';

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

 final bool loading= false;

  _initialScreen(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  Future<void> register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MessageDialog().snackbarGetCut("Account creation failed", "Please enter Strong Password");
      } else if (e.code == 'email-already-in-use') {
        MessageDialog().snackbarGetCut("Account creation failed", "The account already exists for that email.");
      }
    } catch(e){
      MessageDialog().snackbarGetCut("Account creation failed", "");
    }
  }

  Future<void> login(String email, password,context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MessageDialog().snackbarGetCut(
            "Login Failed", "Check your email or create an account.");
      } else if (e.code == 'wrong-password') {
        MessageDialog().snackbarGetCut("Login Failed", "Wrong password ");
      }
    } catch(e){
        MessageDialog().snackbarGetCut("Login Failed", "");
    }
  }

  Future<void> loginOut() async {
    await auth.signOut();
  }
}
