import 'dart:developer';

import 'package:abc_app/Onboarding/domain/user_repo.dart';
import 'package:abc_app/Onboarding/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  UserRepositoryImpl({FirebaseAuth? auth, FirebaseFirestore? firestore})
    : _auth = auth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  String? currentUid() {
    final uid = _auth.currentUser?.uid;
    log('UserRepositoryImpl.currentUid -> $uid');
    return uid;
  }

  @override
  Future<void> saveUser(UserModel user) async {
    log('UserRepositoryImpl.saveUser -> ${user.toMap()}');
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toMap(), SetOptions(merge: true));
  }

  @override
  Future<UserModel> getUser(String uid) async {
    log('UserRepositoryImpl.getUser -> uid: $uid');
    final doc = await _firestore.collection('users').doc(uid).get();

    if (!doc.exists || doc.data() == null) {
      log('UserRepositoryImpl.getUser -> no document');
      return UserModel.empty();
    }

    final data = doc.data()!;
    log('UserRepositoryImpl.getUser -> data: $data');
    return UserModel.fromMap(data);
  }
}
