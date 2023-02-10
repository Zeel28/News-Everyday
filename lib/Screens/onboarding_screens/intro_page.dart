import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_everyday/theme/colors.dart';
class IntroPage extends StatelessWidget {
  String mainText;
  String imgPath;
  String detection;
  IntroPage({Key? key, required this.mainText, required this.imgPath, required String this.detection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left:60,top: 30),
              child: Text(
                mainText,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: primaryColor),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              // padding: const EdgeInsets.all(20.0),
              height: 300,
              width: 300,
              child: Lottie.asset(imgPath),
            ),
            const SizedBox(height: 30,),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left:20),
              padding: const EdgeInsets.fromLTRB(10,0,20,0),
              child: Text(
                detection,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
