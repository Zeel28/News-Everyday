import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  Color? bgColor;
  String mainText;
  Color? mainTextColor;
  AssetImage assetImage;
  String detectionText;
  Color? detectionTextColor;

  IntroPage({
    Key? key,
    required this.bgColor,
    required this.mainText,
    required this.mainTextColor,
    required this.assetImage,
    required this.detectionText,
    required this.detectionTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20, top: 30,right: 10),
              child: Text(
                mainText,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: mainTextColor),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Container(
              height: 240,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: assetImage,fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: Text(
                detectionText,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: detectionTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
