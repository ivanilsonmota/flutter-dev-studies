import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class IAuthRepository {
  Future<String> signIn({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail});

  Future<String> signUp({@required Map<String, dynamic> userData, @required String password});

  Future<Map<String, dynamic>> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isLoggedIn();

  Future<void> resetPassword({@required String email, @required VoidCallback onSuccess, @required VoidCallback onFail});
}
