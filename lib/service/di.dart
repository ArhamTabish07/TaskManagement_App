// import 'package:get_it/get_it.dart';

// class DI {
//   static GetIt i = GetIt.instance;
//   static void instance() {
//     // ---- Data sources ----
//     i.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource());

//     i.registerLazySingleton<BookingRemoteDataSource>(
//       () => BookingRemoteDataSource(),
//     );

//     // i.registerLazySingleton<Database>(() => Database());

//     // ---- Repositories and Services ----
//     i.registerLazySingleton<UserRepository>(
//       () => UserRepositoryImpl(remote: i()),
//     );

//     i.registerLazySingleton<BookingRepository>(
//       () => BookingRepositoryImpl(remote: i()),
//     );
//     i.registerLazySingleton<NavigationService>(() => NavigationService());
//     // ---- Providers ----
//     i.registerLazySingleton<AuthenticationProvider>(
//       () => AuthenticationProvider(userRepo: i<UserRepository>()),
//     );

//     i.registerLazySingleton<UserProvider>(() => UserProvider(repo: i()));

//     i.registerLazySingleton<BookingProvider>(() => BookingProvider(repo: i()));
//   }
// }

// //============= APP PROVIDER =============//
// class AppProviders {
//   static List<SingleChildWidget> providers = [
//     ChangeNotifierProvider(create: (_) => DI.i<AuthenticationProvider>()),
//     ChangeNotifierProvider(create: (_) => DI.i<UserProvider>()),
//     ChangeNotifierProvider(create: (_) => DI.i<BookingProvider>()),
//   ];
// }
