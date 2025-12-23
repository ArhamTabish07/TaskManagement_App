import 'dart:developer';
import 'package:abc_app/core/service/firebase_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> loginWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException in AuthService -> loginWithEmailPassword: $e');
      throw Exception(FirebaseExceptionHandler.handleException(e));
    } catch (e) {
      log('Error in AuthService -> loginWithEmailPassword: $e');
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<bool> signUpWithEmailPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in AuthService -> signUpWithEmailPassword: $e',
      );
      throw Exception(FirebaseExceptionHandler.handleException(e));
    } catch (e) {
      log('Error in AuthService -> signUpWithEmailPassword: $e');
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException in AuthService -> signOut: $e');
      throw Exception(FirebaseExceptionHandler.handleException(e));
    } catch (e) {
      log('Error in AuthService -> signOut: $e');
      throw Exception("Something went wrong. Please try again.");
    }
  }

  // Future<bool> reauthenticate(String email, String password) async {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user == null) throw Exception("No user logged in");
  //     final cred = EmailAuthProvider.credential(
  //       email: email,
  //       password: password,
  //     );
  //     await user.reauthenticateWithCredential(cred);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     log('FirebaseAuthException in AuthService -> reauthenticate: $e');
  //     throw Exception(FirebaseExceptionHandler.handleException(e));
  //   } catch (e) {
  //     log('Error in AuthService -> reauthenticate: $e');
  //     throw Exception("Something went wrong. Please try again.");
  //   }
  // }

  // Future<bool> authStreamListener() async {
  //   try {
  //     return _auth.currentUser != null;
  //   } on FirebaseAuthException catch (e) {
  //     log('FirebaseAuthException in AuthService -> authStreamListener: $e');
  //     throw Exception(FirebaseExceptionHandler.handleException(e));
  //   } catch (e) {
  //     log('Error in AuthService -> authStreamListener: $e');
  //     throw Exception("Something went wrong. Please try again.");
  //   }
  // }

  // Future<bool> updateAuthEmail(String newEmail) async {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user == null) throw Exception("No user logged in");
  //     await user.verifyBeforeUpdateEmail(newEmail);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     log('FirebaseAuthException in AuthService -> updateAuthEmail: $e');
  //     throw Exception(FirebaseExceptionHandler.handleException(e));
  //   } catch (e) {
  //     log('Error in AuthService -> updateAuthEmail: $e');
  //     throw Exception("Something went wrong. Please try again.");
  //   }
  // }

  // Future<bool> sendPasswordResetEmail(String email) async {
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     log('FirebaseAuthException in AuthService -> sendPasswordResetEmail: $e');
  //     throw Exception(FirebaseExceptionHandler.handleException(e));
  //   } catch (e) {
  //     log('Error in AuthService -> sendPasswordResetEmail: $e');
  //     throw Exception("Something went wrong. Please try again.");
  //   }
  // }

  // Future<void> verifyPhoneNumberAndLink({
  //   required String phoneNumber,
  //   required Function(String verificationId, int? resendToken) codeSent,
  //   required Function(UserCredential userCredential) onVerificationCompleted,
  //   required Function(FirebaseAuthException e) onVerificationFailed,
  //   required Function(String verificationId) onCodeAutoRetrievalTimeout,
  //   int? forceResendingToken,
  // }) async {
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       forceResendingToken: forceResendingToken,
  //       timeout: const Duration(seconds: 90),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         final user = _auth.currentUser;
  //         if (user != null) {
  //           final userCredential = await user.linkWithCredential(credential);
  //           onVerificationCompleted(userCredential);
  //         } else {
  //           throw Exception("No user is currently signed in");
  //         }
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         log('FirebaseAuthException in verifyPhoneNumberAndLink: $e');
  //         onVerificationFailed(e);
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         codeSent(verificationId, resendToken);
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         onCodeAutoRetrievalTimeout(verificationId);
  //       },
  //     );
  //   } catch (e) {
  //     log('Error in AuthService -> verifyPhoneNumberAndLink: $e');
  //     throw Exception("Something went wrong during phone verification.");
  //   }
  // }

  // Future<bool> emailAlreadyExist(String email) async {
  //   try {
  //     final snapshot = await _firestore
  //         .collection('users')
  //         .where('email', isEqualTo: email)
  //         .limit(1)
  //         .get();
  //     return snapshot.docs.isNotEmpty;
  //   } on FirebaseAuthException catch (e) {
  //     log('FirebaseAuthException in AuthService -> emailAlreadyExist: $e');
  //     throw Exception(FirebaseExceptionHandler.handleException(e));
  //   } catch (e) {
  //     log('Error in AuthService -> emailAlreadyExist: $e');
  //     throw Exception("Something went wrong. Please try again.");
  //   }
  // }

  // Future<bool> phoneAlreadyExist(String phoneNo) async {
  //   try {
  //     final snapshot = await _firestore
  //         .collection('users')
  //         .where('phoneNumber', isEqualTo: phoneNo)
  //         .limit(1)
  //         .get();
  //     return snapshot.docs.isNotEmpty;
  //   } on FirebaseAuthException catch (e) {
  //     log('FirebaseAuthException in AuthService -> emailAlreadyExist: $e');
  //     throw Exception(FirebaseExceptionHandler.handleException(e));
  //   } catch (e) {
  //     log('Error in AuthService -> emailAlreadyExist: $e');
  //     throw Exception("Something went wrong. Please try again.");
  //   }
  // }
}
