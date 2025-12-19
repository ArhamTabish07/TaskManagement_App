// import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  // Future<bool> authStreamListener();
  Future<bool> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<bool> signUpWithEmailPassword({
    required String email,
    required String password,
  });
  Future<bool> signOut();
}
