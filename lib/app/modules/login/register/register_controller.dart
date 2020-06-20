import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/app/core/models/user_model.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  _RegisterControllerBase() {
    userModel =
        UserModel(name: userName, email: userEmail, password: userPassword);
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
  String userEmail;

  @observable
  String userPassword;

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
}
