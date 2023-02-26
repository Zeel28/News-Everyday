import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../theme/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
          ),
        ),
        centerTitle: true,
        title: const Text("Notifications",
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Clear All",
                style: TextStyle(color: primaryColor),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 350,
                child: Lottie.asset("assets/lottiefile/notifications.json",
                    fit: BoxFit.fill),
              ),
              const Text(
                "No notifications found!",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: darkBluishColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your haven't received any notification yet. Make sure oyu have turned on the notification from the settings.",
                style: TextStyle(color: darkBluishColor,fontSize: 15,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
