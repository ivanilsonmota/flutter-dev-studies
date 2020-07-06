import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/login/login_controller.dart';
import 'package:portfolio/app/widgets/custom_button_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ModularState<LoginScreen, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _keyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Observer(
              builder: (_) {
                return Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) => controller.setEmail(val),
                      enabled: !controller.loading,
                      validator: (val) => controller.emailValidator(val),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintText: 'Senha',
                        suffixIcon: IconButton(
                          icon: !controller.passwordVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      onChanged: (val) => controller.setPassword(val),
                      enabled: !controller.loading,
                      validator: controller.passwordValidator,
                      obscureText: !controller.passwordVisible,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async {
                            if (controller.emailController.text.isEmpty) {
                              _keyScaffold.currentState.showSnackBar(
                                SnackBar(
                                  content: Text('Insira seu e-mail para recuperar a senha!'),
                                  duration: Duration(seconds: 2),
                                  elevation: 0,
                                ),
                              );
                            } else {
                              await controller.auth.resetPassword(
                                email: controller.emailController.text.trim(),
                                onSuccess: onSuccessReset,
                                onFail: onFailReset,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    CustomButton(
                      text: 'Entrar',
                      onTab: () async {
                        if (_formKey.currentState.validate()) {
                          await controller.auth.signIn(
                            email: controller.emailController.text.trim(),
                            password: controller.passwordController.text.trim(),
                            onSuccess: onSuccess,
                            onFail: onFail,
                          );
                          await controller.auth.getCurrentUser();
                        }
                      },
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: InkWell(
                        child: Text(
                          'Registrar',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        onTap: () => Modular.to.pushReplacementNamed('/register'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  onSuccess() {
    Modular.to.pushReplacementNamed('/home');
  }

  onFail() {
    _keyScaffold.currentState.showSnackBar(
      SnackBar(
        content: Text('E-mail e/ou senha inválido!'),
        duration: Duration(seconds: 2),
        elevation: 0,
        backgroundColor: Colors.red[300],
      ),
    );
  }

  onSuccessReset() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      _keyScaffold.currentState.showSnackBar(SnackBar(
        content: Text('Caso o e-mail exista, verifique a sua caixa de entrada!'),
        duration: Duration(seconds: 3),
        elevation: 0,
      ));
      Modular.to.pushReplacementNamed('/');
    });
  }

  onFailReset() {
    _keyScaffold.currentState.showSnackBar(
      SnackBar(
        content: Text('E-mail informado não cadastrado!'),
        duration: Duration(seconds: 3),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
