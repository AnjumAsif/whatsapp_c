import 'package:flutter/material.dart';
import 'package:whatsapp_clone/commons/widgets/error.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: ErrorScreen(
                  text: 'This page doesnot exist',
                ),
              ));
  }
}
