import 'package:flutter/material.dart';
class CustomIconButton extends StatelessWidget {
  IconButton iconButton;
  Color background;
  CustomIconButton({
    super.key, required this.iconButton,required this.background,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: Offset(
                5.0,
                5.0,
              ),
            )
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: iconButton);
  }
}