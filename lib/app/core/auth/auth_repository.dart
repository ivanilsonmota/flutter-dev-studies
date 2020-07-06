import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  Future<String> signIn({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser = result.user;
      onSuccess();
      return firebaseUser.uid;
    } catch (e) {
      onFail();
      print('{\"Where\": signIn function, \"Message\": E-mail e/ou senha inválido!, \"Exception\": $e}');
    }
  }

  Future<String> signUp({@required Map<String, dynamic> userData, @required String password}) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: userData['email'], password: password);
      firebaseUser = result.user;
      await _saveData(userData);
      Modular.to.pushReplacementNamed("/");
      return firebaseUser.uid;
    } catch (e) {
      print('{\"Where\": signUp function, \"Message\": \"E-mail informado já utilizado!\", \"Exception\": $e}');
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    try {
      if (firebaseUser == null) {
        firebaseUser = await _firebaseAuth.currentUser();
      }

      if (firebaseUser != null) {
        if (userData['name'] == null) {
          DocumentSnapshot docUser = await Firestore.instance.collection('users').document(firebaseUser.uid).get();
          userData = docUser.data;
        }
      }
      return userData;
    } catch (e) {
      print('{\"Where\": getCurrentUser function, \"Message\": \"Documento do usuário não existe no Banco de dados!\", \"Exception\": \"$e\"}');
    }
  }

  Future<Null> _saveData(Map<String, dynamic> data) async {
    this.userData = data;
    Firestore.instance.collection('users').document(firebaseUser.uid).setData(data);
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
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

  Future<void> sendEmailVerification() async {
    try {
      firebaseUser = await _firebaseAuth.currentUser();
      firebaseUser.sendEmailVerification();
    } catch (e) {
      return null;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      if (_firebaseAuth.currentUser() != null) {
        return true;
      }
      return false;
    } catch (e) {}
  }
}
