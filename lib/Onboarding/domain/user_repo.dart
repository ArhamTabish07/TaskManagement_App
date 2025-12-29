import 'package:task_management_app/onboarding/model/user_model.dart';

abstract class UserRepository {
  String? currentUid();

  Future<void> createUser(UserModel user);

  Future<UserModel> getUser(String uid);
}
