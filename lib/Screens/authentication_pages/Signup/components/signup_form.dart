import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../firebase/auth_controller.dart';

import '../../../../theme/colors.dart';
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
          TextFormField(
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
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
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
          ),
          Text("By signing up, you agree to the Terms and Conditions and Privacy Policy"),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
              AuthController.instance.signUp(
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
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
