import 'package:task_management_app/onboarding/data/user_data_source.dart';
import 'package:task_management_app/onboarding/domain/user_repo.dart';
import 'package:task_management_app/onboarding/model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl({required this.datasource});

  @override
  String? currentUid() => datasource.currentUid();

  @override
  Future<void> createUser(UserModel user) => datasource.createUser(user);

  @override
  Future<UserModel> getUser(String uid) => datasource.getUser(uid);
}
