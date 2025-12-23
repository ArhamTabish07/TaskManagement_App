import 'package:abc_app/core/service/navigation_service.dart';
import 'package:abc_app/onboarding/provider/auth_provider.dart';
import 'package:abc_app/onboarding/provider/user_provider.dart';
import 'package:abc_app/onboarding/views/login_screen.dart';
import 'package:abc_app/core/dependency_injection/di.dart';
import 'package:abc_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => DI<UserProvider>()),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => DI<AuthenticationProvider>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, // your app bg
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        navigatorKey: NavigationService.navigatorKey,
      ),
    );
  }
}
