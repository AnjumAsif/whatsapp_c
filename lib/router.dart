import 'package:flutter/material.dart';
import 'package:whatsapp_clone/commons/widgets/error.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OtpScreen.routeName:
      String verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OtpScreen(
          verificationId: verificationId,
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: ErrorScreen(
                  text: 'This page doesnot exist',
                ),
              ));
  }
}
