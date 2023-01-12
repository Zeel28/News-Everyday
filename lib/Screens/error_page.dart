import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_everyday/theme/colors.dart';

class ErrorPage404 extends StatelessWidget {
  const ErrorPage404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.center,
              child: Lottie.asset('assets/lottiefile/error-page-404.json'),
            ),
            const SizedBox(height: 30),
            const Text("Page not found",style: TextStyle(color: primaryColor,fontSize: 25,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
