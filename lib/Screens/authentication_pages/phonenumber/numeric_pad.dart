import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_everyday/Screens/authentication_pages/phonenumber/verifty_otp.dart';
import 'package:news_everyday/auth_controller.dart';
import 'package:news_everyday/utils/message.dart';

import '../../../theme/colors.dart';
import '../../Home/Home_page.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  //form validation
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  final _auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  //Country Code Picker
  late FlCountryCodePicker countryPicker;
  CountryCode? countryCode;
  late String finalPhonenumber = "";

  @override
  void initState() {
    final favoriteCountries = ['IN', 'CA', 'US', 'JP'];
    countryPicker = FlCountryCodePicker(
        favorites: favoriteCountries,
        favoritesIcon: const Icon(
          Icons.star,
          color: Colors.amber,
        ));
    // TODO: implement initState
    super.initState();
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
                decoration: BoxDecoration(
                  color: primaryLightColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/phone_auth.png',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Add your phone number. we'll send you a verification code so we know you're real",
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
                        controller: phoneNumberController,
                        keyboardType: TextInputType.text,
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
                          prefixIcon: countryCodePicker(context),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (countryCode != null) {
                              finalPhonenumber =
                              "${countryCode!.dialCode} ${phoneNumberController.text.trim()}";
                              if (_formKey.currentState!.validate()) {
                                AuthController.instance.phoneAuthentication(
                                    finalPhonenumber.trim());
                              } else {
                                MessageDialog().snackbarGetCut(
                                    "Please Enter phone-number", "");
                              }
                            } else {
                              MessageDialog().snackbarGetCut(
                                  "Please select a country code",
                                  "& Enter phone umber");
                            }
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
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: AuthController.isLoading
                                ? CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            )
                                : Text(
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

  Container countryCodePicker(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {
              final code = await countryPicker.showPicker(context: context);
              setState(() {
                countryCode = code;
              });
            },
            child: Row(
              children: [
                Container(
                  child: countryCode != null ? countryCode!.flagImage : null,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: Text(countryCode?.dialCode ?? "+91",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthController.instance.verifyOTP(otp);
    isVerified ? Get.offAll(Dashboard()) : Get.back();
  }
}
