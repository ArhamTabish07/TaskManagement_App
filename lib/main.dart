import 'package:abc_app/Onboarding/provider/authentication_provider.dart';
import 'package:abc_app/Onboarding/provider/user_provider.dart';
import 'package:abc_app/Onboarding/views/login_screen.dart';
import 'package:abc_app/di.dart';
import 'package:abc_app/firebase_options.dart';
import 'package:abc_app/service/navigation_service.dart';
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
