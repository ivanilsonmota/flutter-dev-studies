import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      onSuccess();
      return user.uid;
    } catch (e) {
      onFail();
      print('{\"Where\": signIn function, \"Message\": E-mail e/ou senha inválido!, \"Exception\": $e}');
    }
  }

  Future<String> signUp({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      onSuccess();
      return user.uid;
    } catch (e) {
      print('{\"Where\": signUp function, \"Message\": \"E-mail informado já utilizado!\", \"Exception\": $e}');
      onFail();
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      user.sendEmailVerification();
    } catch (e) {
      return null;
    }
  }

  Future<bool> isEmailVerified() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      return user.isEmailVerified;
    } catch (e) {}
  }

  Future<void> resetPassword({@required String email, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      onSuccess();
    } catch (e) {
      onFail();
      print('{\"Where\": \"resetPassword function\", \"Message\": \"Email informado não existe!\", \"Exception\": $e}');
    }
  }
}
