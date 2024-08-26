import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String text;

  const ErrorScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
