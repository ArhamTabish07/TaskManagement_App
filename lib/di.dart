import 'package:get_it/get_it.dart';
import 'package:abc_app/Onboarding/data/auth_service.dart';
import 'package:abc_app/Onboarding/data/auth_repo_impl.dart';
import 'package:abc_app/Onboarding/domain/auth_repo.dart';
import 'package:abc_app/Onboarding/data/user_repo_impl.dart';
import 'package:abc_app/Onboarding/domain/user_repo.dart';
import 'package:abc_app/Onboarding/provider/authentication_provider.dart';
import 'package:abc_app/Onboarding/provider/user_provider.dart';

final DI = GetIt.instance;

Future<void> setupDI() async {
  // Services / repos
  DI.registerLazySingleton<AuthService>(() => AuthService());

  DI.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authService: DI<AuthService>()),
  );

  DI.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

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
