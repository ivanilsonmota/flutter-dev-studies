import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ModularState<LoginScreen, LoginController> {
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (controller.loggedIn) {
      Modular.to.pushNamed('/home');
    }
    super.initState();
  }

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
                  validator: (text) {
                    if (text.isEmpty != !text.contains('@'))
                      return "E-mail inválido!";
                  },
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
                );
              }),
              SizedBox(height: 16.0),
              Observer(
                builder: (_) {
                  return _signInButton();
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: InkWell(
                  child: Text(
                    'Registrar',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
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

  _loginErrorDialog() {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Erro'),
        content: Text('E-mail e/ou senha inválida'),
        actionsPadding: EdgeInsets.all(20.0),
        actions: [
          RaisedButton(
            child: Text('OK'),
            animationDuration: Duration(seconds: 2),
            onPressed: () => Modular.to.pushNamed('/'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  _signInButton() {
    return InkWell(
      child: ButtonTheme(
        minWidth: 370.0,
        height: 50.0,
        child: Container(
          width: 370.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Theme.of(context).primaryColor,
          ),
          child: controller.loading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Colors.white,
                  ),
                )
              : Center(
                  child: Text('Login'),
                ),
        ),
      ),
      onTap: () {
        if (_formKey.currentState.validate()) {}
        Modular.to.pushNamed('/home');
        //return _loginErrorDialog();
      },
    );
  }
}
