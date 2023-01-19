import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';

class MessageDialog{

  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }



  SnackbarController snackbarGetCut(String title, String message) {
    return Get.snackbar("About User", "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
            title, style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
        messageText: Text(
          message, style: const TextStyle(color: Colors.white),)

    );
  }

  void progressIndicator2(context){
    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(backgroundColor: primaryColor, color: primaryLightColor,));
    });
  }

  alertDialog(context,String mainTitle, String subTitle, String buttonText){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(mainTitle),
        content: Text(subTitle),
        backgroundColor: primaryLightColor,

        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              alignment: Alignment.center,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryColor,
              ),
              margin: const EdgeInsets.fromLTRB(0,0,8,8),
              padding: const EdgeInsets.all(15),
              child: Text(buttonText,style: TextStyle(color: Colors.white,fontSize: 16),),
            ),
          ),
        ],
      ),
    );
  }
}