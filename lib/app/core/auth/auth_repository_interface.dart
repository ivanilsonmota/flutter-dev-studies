import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

abstract class IAuthRepository {
  Future<String> signIn({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail});

  Future<String> signUp({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail});

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> resetPassword({@required String email, @required VoidCallback onSuccess, @required VoidCallback onFail});
}
