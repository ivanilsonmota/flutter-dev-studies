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
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

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
          child: ListView(
            children: [
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                  ),
                  controller: controller.emailController,
                  keyboardType: TextInputType.text,
                  onChanged: (val) => controller.setEmail(val),
                  enabled: !controller.loading,
                  validator: (val) => controller.emailValidator(val),
                );
              }),
              SizedBox(height: 16.0),
              Observer(builder: (_) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                  ),
                  controller: controller.passwordController,
                  keyboardType: TextInputType.text,
                  onChanged: (val) => controller.setPassword(val),
                  enabled: !controller.loading,
                  validator: controller.passwordValidator,
                );
              }),
              SizedBox(height: 16.0),
              Observer(
                builder: (BuildContext ctx) {
                  return CustomButton(
                    text: 'Entrar',
                    onTab: () {
                      if (_formKey.currentState.validate()) {
                        controller.loading = true;
                        Modular.to.pushNamed('/home');
                      } else {
                        Scaffold.of(ctx).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text("Email e/ou senha inválida  !"),
                            action: SnackBarAction(
                              onPressed: () => Modular.to.pushReplacementNamed('/'),
                              label: '',
                            ),
                            backgroundColor: Colors.red[300],
                          ),
                        );
                      }
                    },
                  );
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
          ),
        ),
      ),
    );
  }
}
