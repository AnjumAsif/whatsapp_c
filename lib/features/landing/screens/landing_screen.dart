import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/commons/widgets/custom_button.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  navigateToNextScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Welcome to Whatsapp',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                  SizedBox(
                    height: size.height / 9,
                  ),
                  Image.asset(
                    'assets/bg.png',
                    height: 340,
                    width: 340,
                    color: tabColor,
                  ),
                  SizedBox(
                    height: size.height / 9,
                  ),

                ],
              ),
              const Text(
                'Read our Privacy Policy. Tap "Agree and continue" to acknowledge',
                style: TextStyle(fontSize: 14, color: greyColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
                width: size.width * 0.95,
                child: CustomButton(
                    text: "AGREE AND CONTINUE",
                    onPressed: () {
                      navigateToNextScreen(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
