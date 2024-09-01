import 'package:flutter/material.dart';

import '../../../colors.dart';

class OtpScreen extends StatefulWidget {
  String verificationId;

  OtpScreen({super.key, required this.verificationId});

  static const routeName = "/otp-screen";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifying your number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('We have sent a SMS code'),
            SizedBox(
              width: size.width * 0.5,
              child: const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(fontSize: 30),
                ),
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
      ),
    );
  }
}
