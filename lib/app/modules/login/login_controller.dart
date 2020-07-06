import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/app/core/auth/auth_repository.dart';
import 'package:portfolio/app/core/auth/auth_repository_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerStore with _$LoginController;

abstract class _LoginControllerStore with Store {
  AuthRepository auth = Modular.get<IAuthRepository>();

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
  bool togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  logoff() async {
    await Modular.get().logout();
    Modular.to.pushReplacementNamed('/login');
  }

  @action
  String emailValidator(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Digite um e-mail válido!';
    } else {
      return null;
    }
  }

  @action
  bool sendEmail(String email) {
    // Enviar e-mail

    return true;
  }

  @action
  String passwordValidator(String value) => value.length < 6 ? "Senha inválida. Deve conter ao menos 6 caracteres!" : null;
}
