import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/theme/colors.dart';

class MessageDialog {

  //TODO: Custom Snack bar
  SnackbarController snackBarGetCut(String title, String message, {var backgroundColor = Colors.redAccent}) {
    return Get.snackbar("About User", "User message",
        backgroundColor: backgroundColor,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));
  }

  progressIndicator(context) {
    return  AlertDialog(
      shape: const CircleBorder(),
      shadowColor: primaryColor,
      backgroundColor: primaryLightColor,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
                color: primaryColor,
                backgroundColor: primaryLightColor),
          ),
        ],
      ),
    );
  }

  //TODO: Custom Alert Dialog
  alertDialog(context, String mainTitle, String subTitle, String buttonText,VoidCallback continueCallBack,
      {bool disMissible = true}) {
    showDialog(
      context: context,
      barrierDismissible: disMissible,
      builder: (ctx) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: Text(mainTitle),
          content: Text(subTitle),
          backgroundColor: primaryLightColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: <Widget>[
            InkWell(
              onTap: () {
                continueCallBack();

              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor,
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                padding: const EdgeInsets.all(15),
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}