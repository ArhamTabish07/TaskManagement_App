import 'package:abc_app/onboarding/data/user_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:abc_app/onboarding/data/auth_data_source.dart';
import 'package:abc_app/onboarding/data/auth_repo_impl.dart';
import 'package:abc_app/onboarding/domain/auth_repo.dart';
import 'package:abc_app/onboarding/data/user_repo_impl.dart';
import 'package:abc_app/onboarding/domain/user_repo.dart';
import 'package:abc_app/onboarding/provider/auth_provider.dart';
import 'package:abc_app/onboarding/provider/user_provider.dart';

final DI = GetIt.instance;

Future<void> setupDI() async {
  // Services / repos
  DI.registerLazySingleton<AuthService>(() => AuthService());

  DI.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authService: DI<AuthService>()),
  );

  DI.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(datasource: UserDatasource()),
  );

  // Providers
  DI.registerLazySingleton<UserProvider>(
    () => UserProvider(userRepo: DI<UserRepository>()),
  );

  DI.registerLazySingleton<AuthenticationProvider>(
    () => AuthenticationProvider(
      authRepo: DI<AuthRepo>(),
      userProvider: DI<UserProvider>(),
    ),
  );
}
