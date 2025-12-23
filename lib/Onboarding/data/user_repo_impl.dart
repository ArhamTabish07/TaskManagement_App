import 'package:abc_app/Onboarding/data/user_data_source.dart';
import 'package:abc_app/Onboarding/domain/user_repo.dart';
import 'package:abc_app/Onboarding/model/user_model.dart';

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
