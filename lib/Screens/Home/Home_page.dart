import '../../auth_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String? email;

  HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              Text(
                email!,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              MaterialButton(
                onPressed: () {
                  AuthController.instance.loginOut();
                },
                color: Colors.cyan,
                padding: EdgeInsets.all(20),
                child: Text("Sign out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
