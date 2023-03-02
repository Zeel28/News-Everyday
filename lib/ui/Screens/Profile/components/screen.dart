import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';

class SettingOptionScreen extends StatelessWidget {

  String appBarTitle;

  SettingOptionScreen({Key? key,required this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        title:  Text(appBarTitle,
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
      ),
    );
  }
}
