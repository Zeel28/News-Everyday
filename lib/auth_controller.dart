import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_everyday/Screens/Home/Home_page.dart';
import 'package:news_everyday/Screens/Welcome/welcome_screen.dart';
import 'package:news_everyday/Screens/authentication_pages/Signup/email_verification.dart';
import 'package:news_everyday/utils/message.dart';

import 'Screens/authentication_pages/phonenumber/numeric_pad.dart';
import 'Screens/authentication_pages/phonenumber/verifty_otp.dart';
import 'Screens/introduction_screens/onboarding_screen.dart';

class AuthController extends GetxController {
  static var isLoading = false;

  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth _auth = FirebaseAuth.instance;

  var verificationId = ''.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => const WelcomeScreen());
    } else {
      print(user);
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;
      print("{$name and $email and }");
      if (user.emailVerified == false) {
        Get.offAll(() => EmailVerificationScreen());
      } else {
        Get.offAll(() => HomePage());
      }
    }
  }

  //TODO: Email and Password Signup
  Future<void> signUp(String email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
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

  //TODO: Email and Password SignIn
  Future<void> signIn(String email, password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  //TODO: Phone number Authentication
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          MessageDialog().snackbarGetCut(
              "The provided phone number is not valid.",
              "Please enter valid phone number");
        } else {
          MessageDialog()
              .snackbarGetCut("Error", "Something went wrong. Try again!");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
        Get.to(() => const OTPScreen());
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
        MessageDialog().snackbarGetCut(verificationId.toString(), "");
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  //TODO: Sign out
  Future<void> loginOut() async {
    await _auth.signOut();
  }
}

class SocialAuth {
  //TODO: Google SignIn
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
