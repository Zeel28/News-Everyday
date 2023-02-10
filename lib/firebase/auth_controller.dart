import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Screens/authentication_pages/Login/login_screen.dart';
import 'package:news_everyday/utils/message.dart';
import '../Screens/dashboard.dart';
import '../Screens/authentication_pages/phonenumber/verifty_otp.dart';
import '../Screens/onboarding_screens/onboarding_screen.dart';
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
      // print("Login Page");
      Get.offAll(() => const OnBoardingScreen());
    } else {
      // print(user);
      UserInfo? zx;
      addUser(user,zx);


      Get.offAll(() => Dashboard());

    }
  }

  Future<void> addUser(User user, UserInfo? zx) {
    CollectionReference zeel = FirebaseFirestore.instance.collection('users_information');
    return zeel
        .doc(user.uid)
        .set({
          'id': user.uid,
          'full_name': user.displayName,
          'email': user.email,
          'emailVerified': user.emailVerified,
          'phoneNumber': user.phoneNumber,
          'photoURL': user.photoURL,
          'providerId': zx?.providerId.toString(),
          'uid': user.uid
        })
        .onError((error, stackTrace) {print("Failed to add user: $error");});
  }

  //TODO: Email and Password Signup
  Future<void> signUp(String email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MessageDialog().snackBarGetCut(
            "Account creation failed", "Please enter Strong Password");
      } else if (e.code == 'email-already-in-use') {
        MessageDialog().snackBarGetCut("Account creation failed",
            "The account already exists for that email.");
      }
    } catch (e) {
      MessageDialog().snackBarGetCut("Account creation failed", "");
    }
  }

  //TODO: Email and Password SignIn
  Future<void> signIn(String email, password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MessageDialog().snackBarGetCut(
            "Login Failed", "Check your email or create an account.");
      } else if (e.code == 'wrong-password') {
        MessageDialog().snackBarGetCut("Login Failed", "Wrong password ");
      }
    } catch (e) {
      MessageDialog().snackBarGetCut("Login Failed", "");
    }
  }

  //TODO: Forgot Password
  Future<void> forgotPassword(String email, context) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((value) => MessageDialog().alertDialog(
                context,
                "Reset password email sent",
                "You should soon receive an email allowing you to reset your password. Please make sure to check your spam and trash if you can't find the email.",
                "Login",
                disMissible: false,
                () {
                  Get.off(() => LoginScreen());
                },
              ))
          .catchError((e) {
        MessageDialog().snackBarGetCut("Error", e);
      });
    }on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        MessageDialog().snackBarGetCut("Invalid Email",
            "Please Enter Valid Email Address");
      }else if (e.code == 'id-token-expired') {
        MessageDialog().snackBarGetCut("Invalid Verification",
            "Sent link are expired");
      }
    } catch (e) {
      MessageDialog().snackBarGetCut("Error", e.toString());
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
          MessageDialog().snackBarGetCut(
              "The provided phone number is not valid.",
              "Please enter valid phone number");
        } else {
          MessageDialog()
              .snackBarGetCut("Error", "Something went wrong. Try again!");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
        Get.to(() => const OTPScreen());
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
        MessageDialog().snackBarGetCut(verificationId.toString(), "");
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
