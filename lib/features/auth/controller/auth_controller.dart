import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/repository/auth-repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  void signInWithPhoneNumber(BuildContext context, String phoneNumber) {
    authRepository.signWithPhone(context, phoneNumber);
  }
}
