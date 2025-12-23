import 'package:abc_app/Onboarding/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get users =>
      _firestore.collection('users');

  String? currentUid() => _auth.currentUser?.uid;

  Future<void> createUser(UserModel user) async {
    final uid = user.uid;

    if (uid.isEmpty) {
      throw Exception('User uid is empty');
    }

    await users.doc(uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future<UserModel> getUser(String uid) async {
    if (uid.isEmpty) return UserModel.empty();

    final doc = await users.doc(uid).get();

    final data = doc.data();
    if (!doc.exists || data == null) {
      return UserModel.empty();
    }

    return UserModel.fromMap(data);
  }
}
