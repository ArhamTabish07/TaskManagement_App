import 'package:abc_app/Onboarding/model/user_model.dart';

abstract class UserRepository {
  /// uid of currently logged-in Firebase user
  String? currentUid();

  /// Save / update user profile in Firestore
  Future<void> saveUser(UserModel user);

  /// Get user profile by uid from Firestore
  Future<UserModel> getUser(String uid);
}
