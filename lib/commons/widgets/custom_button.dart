import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: blackColor),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: tabColor, minimumSize: Size(double.infinity, 50)),
    );
  }
}
