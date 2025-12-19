import 'dart:async';
import 'dart:developer';

import 'package:abc_app/Onboarding/data/auth_repo_impl.dart';
import 'package:abc_app/Onboarding/domain/auth_repo.dart';
import 'package:abc_app/Onboarding/provider/user_provider.dart';
import 'package:abc_app/Tab/Home/home_screen.dart';
import 'package:abc_app/service/navigation_service.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  final AuthRepo authRepo;
  final UserProvider userProvider;

  bool isLoading = false;
  bool fullScreenLaoder = false;

  AuthenticationProvider({required this.authRepo, required this.userProvider});

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setFullScreenLoading(bool value) {
    fullScreenLaoder = value;
    notifyListeners();
  }

  //============== LOGIN ==============//

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      log('AuthenticationProvider.login -> calling authRepo.login');
      await authRepo.loginWithEmailPassword(email: email, password: password);

      log('AuthenticationProvider.login -> login success, loading user');
      await userProvider.loadCurrentUser();

      NavigationService().pushReplacementToScreen(
        nextScreen: const HomeScreen(),
      );
    } catch (e) {
      log("AuthProvider -> login error: $e");
      NavigationService().showToast(e.toString());
    } finally {
      setLoading(false);
    }
  }

  //============== SIGN UP ==============//

  Future<void> signup({
    required String email,
    required String password,
    String? fullName,
  }) async {
    setLoading(true);
    try {
      log('AuthenticationProvider.signup -> calling authRepo.signUp');
      await authRepo.signUpWithEmailPassword(email: email, password: password);

      log(
        'AuthenticationProvider.signup -> signup success, creating Firestore user',
      );
      await userProvider.createUserOnSignup(email: email, name: fullName);

      // You can go directly to home after signup:
      NavigationService().pushReplacementToScreen(
        nextScreen: const HomeScreen(),
      );
    } catch (e) {
      log("AuthProvider -> signup error: $e");
      NavigationService().showToast(e.toString());
    } finally {
      setLoading(false);
    }
  }

  //============== SIGN OUT ==============//

  Future<void> signout({bool toWelcomScreen = false}) async {
    setLoading(true);
    try {
      await authRepo.signOut();
      userProvider.clear();
      // navigate to welcome/login if you want
    } catch (e) {
      log("AuthProvider -> signout error: $e");
      NavigationService().showToast(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
