import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerStore with _$LoginController;

abstract class _LoginControllerStore with Store {
  @observable
  String email;

  @observable
  String password;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool loading = false;

  @action
  setEmail(String val) => email = val;

  @action
  setPassword(String val) => password = val;

  @observable
  bool passwordVisible = false;

  @observable
  bool loggedIn = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  logoff() async {
    await Modular.get().logout();
    Modular.to.pushReplacementNamed('/login');
  }
}
