import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/commons/utils/utils.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  void signWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            print('verification code--> ${e.message}');
            throw Exception(e.message);
          },
          codeSent: ((String verificationCode, int? resendToken) async {
            print('verification code $verificationCode');
            Navigator.pushNamed(context, OtpScreen.routeName,arguments: verificationCode);
          }),
          codeAutoRetrievalTimeout: (String verifId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
