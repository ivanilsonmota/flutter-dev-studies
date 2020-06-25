// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerStore, Store {
  final _$emailAtom = Atom(name: '_LoginControllerStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_LoginControllerStore.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: '_LoginControllerStore.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginControllerStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$passwordVisibleAtom =
      Atom(name: '_LoginControllerStore.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$loggedInAtom = Atom(name: '_LoginControllerStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$logoffAsyncAction = AsyncAction('_LoginControllerStore.logoff');

  @override
  Future logoff() {
    return _$logoffAsyncAction.run(() => super.logoff());
  }

  final _$_LoginControllerStoreActionController =
      ActionController(name: '_LoginControllerStore');

  @override
  dynamic setEmail(String val) {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.setEmail');
    try {
      return super.setEmail(val);
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String val) {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.setPassword');
    try {
      return super.setPassword(val);
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String emailValidator(String value) {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.emailValidator');
    try {
      return super.emailValidator(value);
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool sendEmail(String email) {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.sendEmail');
    try {
      return super.sendEmail(email);
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String passwordValidator(String value) {
    final _$actionInfo = _$_LoginControllerStoreActionController.startAction(
        name: '_LoginControllerStore.passwordValidator');
    try {
      return super.passwordValidator(value);
    } finally {
      _$_LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
emailController: ${emailController},
passwordController: ${passwordController},
loading: ${loading},
passwordVisible: ${passwordVisible},
loggedIn: ${loggedIn}
    ''';
  }
}
