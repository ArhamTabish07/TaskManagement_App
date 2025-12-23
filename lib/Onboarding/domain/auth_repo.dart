abstract class AuthRepo {
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
