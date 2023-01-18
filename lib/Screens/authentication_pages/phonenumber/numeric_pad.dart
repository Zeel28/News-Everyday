import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_everyday/Screens/authentication_pages/phonenumber/verifty_otp.dart';
import 'package:news_everyday/utils/message.dart';

import '../../../theme/colors.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  bool loading = false;
  final _auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryLightBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
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
              SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: primaryLightColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-2.jpg',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Registration',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Add your phone number. we'll send you a verification code so we know you're real",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '(+91)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // suffixIcon: Icon(
                        //   Icons.check_circle,
                        //   color: Colors.green,
                        //   size: 32,
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          _auth
                              .verifyPhoneNumber(
                            phoneNumber: phoneNumberController.text,
                            verificationCompleted: (phoneAuthCredential) {
                              setState(() {
                                loading = false;
                              });
                            },
                            verificationFailed: (error) {
                              MessageDialog().snackbarGetCut(error.toString(), "");
                              setState(() {
                                loading = false;
                              });
                            },
                            codeSent: (String verificationId, int? forceResendingToken) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpVerifictionScreen(verificationId: verificationId),
                                  ));
                              setState(() {
                                loading = false;
                              });
                            },
                            codeAutoRetrievalTimeout: (verificationId) {
                              MessageDialog().snackbarGetCut(verificationId.toString(), "");
                              setState(() {
                                loading = false;
                              });
                            },
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: loading
                              ? CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          )
                              : Text(
                            "Send",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
