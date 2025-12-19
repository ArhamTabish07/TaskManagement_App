import 'dart:developer';

import 'package:abc_app/Onboarding/domain/user_repo.dart';
import 'package:abc_app/Onboarding/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final UserRepository userRepo;
  final FirebaseAuth _auth;

  UserProvider({required this.userRepo, FirebaseAuth? auth})
    : _auth = auth ?? FirebaseAuth.instance;

  UserModel _currentUser = UserModel.empty();
  bool _isLoading = false;

  UserModel get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loadCurrentUser() async {
    final uid = userRepo.currentUid();
    log('UserProvider.loadCurrentUser -> uid: $uid');

    if (uid == null) {
      _currentUser = UserModel.empty();
      notifyListeners();
      return;
    }

    _setLoading(true);
    try {
      // 1) Try Firestore user
      final userFromDb = await userRepo.getUser(uid);

      if (userFromDb.isNotEmpty) {
        log('UserProvider.loadCurrentUser -> got user from Firestore');
        _currentUser = userFromDb;
      } else {
        // 2) Fallback to FirebaseAuth basic data
        final firebaseUser = _auth.currentUser;
        log(
          'UserProvider.loadCurrentUser -> Firestore empty, fallback auth user: $firebaseUser',
        );

        if (firebaseUser != null) {
          final user = UserModel(
            uid: firebaseUser.uid,
            email: firebaseUser.email ?? '',
            name: firebaseUser.displayName ?? '',
            image: firebaseUser.photoURL ?? '',
          );

          _currentUser = user;

          // Optionally persist it to Firestore so next time it comes from DB
          await userRepo.saveUser(user);
        } else {
          _currentUser = UserModel.empty();
        }
      }
    } catch (e) {
      log('UserProvider.loadCurrentUser error: $e');
      _currentUser = UserModel.empty();
    } finally {
      _setLoading(false);
    }
  }

  /// Call this right after signup to create Firestore user
  Future<void> createUserOnSignup({required String email, String? name}) async {
    final uid = userRepo.currentUid();
    log(
      'UserProvider.createUserOnSignup -> uid: $uid email: $email name: $name',
    );

    if (uid == null) {
      log('UserProvider.createUserOnSignup -> currentUid is null');
      return;
    }

    final user = UserModel(uid: uid, email: email, name: name ?? '', image: '');

    await userRepo.saveUser(user);
    _currentUser = user;
    notifyListeners();
  }

  void clear() {
    _currentUser = UserModel.empty();
    notifyListeners();
  }
}
