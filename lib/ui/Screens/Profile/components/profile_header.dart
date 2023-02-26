import 'package:flutter/cupertino.dart';

class ProfileCard extends StatelessWidget {

  List userData = [];

   ProfileCard({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Text(name),
        ],
      ),
    );
  }
}
