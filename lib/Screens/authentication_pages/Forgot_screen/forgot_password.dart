import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                  child: Lottie.asset("assets/lottiefile/forgot-password.json",fit: BoxFit.fill),
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
                              return 'Please enter phone-number';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
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
                            onPressed: () {
                                print(forgotEmailController);
                            },
                            // onPressed: () {
                            //   if (countryCode != null) {
                            //     finalPhonenumber =
                            //     "${countryCode!.dialCode} ${phoneNumberController.text.trim()}";
                            //     if (_formKey.currentState!.validate()) {
                            //       AuthController.instance.phoneAuthentication(
                            //           finalPhonenumber.trim());
                            //     } else {
                            //       MessageDialog().snackbarGetCut(
                            //           "Please Enter phone-number", "");
                            //     }
                            //   } else {
                            //     MessageDialog().snackbarGetCut(
                            //         "Please select a country code",
                            //         "& Enter phone umber");
                            //   }
                            // },
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
                            child: Padding(
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
