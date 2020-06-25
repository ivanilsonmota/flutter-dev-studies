import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/app/core/auth/auth_repository.dart';
import 'package:portfolio/app/core/auth/auth_repository_interface.dart';
import 'package:portfolio/app/core/models/user_model.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  AuthRepository auth = Modular.get<IAuthRepository>();

  _RegisterControllerBase() {
    userModel = UserModel(name: userName, email: userEmail, password: userPassword);
  }

  @observable
  UserModel userModel;

  @observable
  ObservableList<UserModel> map = ObservableList<UserModel>();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  String userName = '';

  @observable
  String userEmail = '';

  @observable
  String userPassword = '';

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  setName(val) => userName = val;

  @action
  setEmail(val) => userEmail = val;

  @action
  setPassowod(val) => userPassword = val;

  @action
  String nameValidator(String value) => value.length < 3 ? "Nome inválido. Deve conter ao menos 3 caracteres!" : null;

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
  String passwordValidator(String value) => value.length < 6 ? "Senha inválida. Deve conter ao menos 6 caracteres!" : null;
}
