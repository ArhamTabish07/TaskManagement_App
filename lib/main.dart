import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Onboarding/views/login_screen.dart';
import 'package:task_management_app/core/dependency_injection/di.dart';
import 'package:task_management_app/core/service/navigation_service.dart';

import 'onboarding/provider/auth_provider.dart';
import 'onboarding/provider/user_provider.dart';
import 'nav_bar/Message/GroupChat/provider/chat_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DI<UserProvider>()),
        ChangeNotifierProvider.value(value: DI<AuthenticationProvider>()),
        ChangeNotifierProvider.value(value: DI<ChatProvider>()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        scaffoldMessengerKey: NavigationService.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}
