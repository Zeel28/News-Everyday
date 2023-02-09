import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_everyday/Screens/authentication_pages/Login/login_screen.dart';
import 'package:news_everyday/firebase/auth_controller.dart';
import 'package:news_everyday/utils/message.dart';
import '../../../round_button.dart';
import '../../../theme/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final forgotEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    forgotEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF7F6FB),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: primaryLightColor,
                    shape: BoxShape.circle,
                  ),
                  child: Lottie.asset("assets/lottiefile/sendmail.json",
                      fit: BoxFit.fill),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter the email associated with your account and we will send you link to reset your account",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 28,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: forgotEmailController,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          cursorColor: primaryColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Empty email';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter email ",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.mail),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            // prefixIcon: countryCodePicker(context),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {}
                              AuthController.instance.forgotPassword(forgotEmailController.text.trim(), context);
                              // final _status = await resetPassword(
                              //     email: forgotEmailController.text.trim());
                              // if (_status == AuthStatus.successful) {
                              //   MessageDialog().alertDialog(
                              //       context, "Reset password email sent",
                              //       "You should soon receive an email allowing you to reset your password. Please make sure to check your spam and trash if you can't find the email.",
                              //       "Login",disMissible: false, () {
                              //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              //       },);
                              // } else if (_status == AuthStatus.invalidEmail) {
                              //   MessageDialog().snackBarGetCut(
                              //       "sd", "invalidEmail");
                              // } else if (_status == AuthStatus.wrongPassword) {
                              //   MessageDialog().snackBarGetCut(
                              //       "sd", "AuthStatus.wrongPassword");
                              // } else if (_status == AuthStatus.weakPassword) {
                              //   MessageDialog().snackBarGetCut(
                              //       "sd", "AuthStatus.weakPassword");
                              // } else
                              // if (_status == AuthStatus.emailAlreadyExists) {
                              //   MessageDialog().snackBarGetCut(
                              //       "sd", "AuthStatus.emailAlreadyExists");
                              // } else if (_status == AuthStatus.unknown) {
                              //   MessageDialog().snackBarGetCut(
                              //       "sd", "AuthStatus.unknown");
                              // } else if (_status == AuthStatus.invalidEmail) {
                              //   MessageDialog().snackBarGetCut(
                              //       "sd", "invalidEmail");
                              // }
                            },
                            style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
