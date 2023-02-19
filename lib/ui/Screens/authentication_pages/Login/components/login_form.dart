import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../firebase/auth_controller.dart';
import '../../../../theme/colors.dart';
import '../../Forgot_screen/forgot_password.dart';
import '../../Signup/signup_screen.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/forgot_screen.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

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
                child: Icon(Icons.mail),
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
          Forgot(
            press: () => Get.to(ForgotPassword()),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {}
              AuthController.instance.signIn(emailController.text.trim(),
                  passwordController.text.trim(), context);
            },
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Get.offAll(() => SignUpScreen());
            },
          ),
        ],
      ),
    );
  }
}
