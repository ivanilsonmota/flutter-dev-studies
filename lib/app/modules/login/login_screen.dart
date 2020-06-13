import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ModularState<LoginScreen, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Efetuar Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Digite o seu email',
                      ),
                      onChanged: (value) => null,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Digite a sua senha',
                      ),
                      onChanged: (value) => null,
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      child: Text('Entrar'),
                      onPressed: () => Modular.to.pushNamed('/home'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
