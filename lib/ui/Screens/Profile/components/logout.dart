import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../../firebase/auth_controller.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SlideAction(
        onSubmit: () => AuthController().loginOut(),
        outerColor: Colors.redAccent[100],
        innerColor: Colors.red,
        elevation: 0,
        // borderRadius: 12,
        height: 60,
        sliderButtonIconPadding: 13,
        text: "Log out",
        textStyle: const TextStyle(color: Colors.white,fontSize: 22,letterSpacing: 3,
          fontWeight: FontWeight.w400,),
        sliderButtonIcon: const Icon(
          Icons.power_settings_new_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
