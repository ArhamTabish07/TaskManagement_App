import 'package:abc_app/onboarding/data/auth_data_source.dart';
import 'package:abc_app/onboarding/domain/auth_repo.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService authService;

  AuthRepoImpl({required this.authService});

  @override
  Future<bool> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    return authService.loginWithEmailPassword(email, password);
  }

  @override
  Future<bool> signUpWithEmailPassword({
    required String email,
    required String password,
  }) {
    return authService.signUpWithEmailPassword(email, password);
  }

  @override
  Future<bool> signOut() {
    return authService.signOut();
  }
}
