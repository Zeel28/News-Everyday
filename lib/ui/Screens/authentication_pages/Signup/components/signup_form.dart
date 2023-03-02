import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/auth_controller.dart';
import '../../../../theme/colors.dart';
import '../../../Profile/pages/privacy_policy.dart';
import '../../Login/login_screen.dart';
import '../../components/already_have_an_account_acheck.dart';

class SignUpForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: primaryColor,
              onSaved: (email) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email ';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.mail),
                ),
              ),
            ),
          ),
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: primaryColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password ';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 4),
          privacyPolicyAndTermsOfService(),
          const SizedBox(height: defaultPadding / 0.5),
          ElevatedButton(
            onPressed: () {

              if (_formKey.currentState!.validate()) {}
              AuthController().signUp(
                  emailController.text.trim(), passwordController.text.trim());
            },
            child: Text(
              "Sign up".toUpperCase(),
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Get.to(() => LoginScreen());
            },
          ),
        ],
      ),
    );
  }

  Container privacyPolicyAndTermsOfService() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Text.rich(TextSpan(
          text: 'By signing up, you agree to the ',
          style: const TextStyle(fontSize: 13, color: primaryColor),
          children: <TextSpan>[
            TextSpan(
                text: 'Terms and Conditions ',
                style: const TextStyle(
                  fontSize: 13,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(() => const PrivacyPolicy());
                  }),
            TextSpan(
                text: ' and ',
                style: const TextStyle(fontSize: 14, color: primaryColor),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Privacy Policy ',
                      style: const TextStyle(
                          fontSize: 13,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const PrivacyPolicy());
                        })
                ])
          ])),
    );
  }
}
