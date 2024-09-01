import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/commons/utils/utils.dart';
import 'package:whatsapp_clone/commons/widgets/custom_button.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/loginscreen';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? _country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  showCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country country) {
          setState(() {
            _country = country;
          });
        });
  }

  sendPhoneNumber() {
    String phone = phoneController.text.trim();
    if (_country != null && phone.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhoneNumber(context, '+${_country!.phoneCode}$phone');
    } else {
      showSnackBar(context, 'please enter mobile number');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('WhatsApp will need to verify your phone number.'),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    child: const Text('Pick Country'),
                    onPressed: () {
                      showCountry();
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    if (_country != null) Text('+${_country!.phoneCode}'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * .7,
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(hintText: 'phone number'),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
              child: CustomButton(
                text: 'NEXT',
                onPressed: sendPhoneNumber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
