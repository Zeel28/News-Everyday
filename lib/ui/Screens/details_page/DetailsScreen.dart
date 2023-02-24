import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/colors.dart';

class CategoryScreen extends StatelessWidget {
  String title;
   CategoryScreen({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            )),
        centerTitle: true,
        title:  Text(title,
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
      ),
    );
  }
}
