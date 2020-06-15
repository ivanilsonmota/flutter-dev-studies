import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ModularState<LoginScreen, LoginController> {
  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    autorun((_) {
      _keyScaffold.currentState.showSnackBar(
        SnackBar(
          content: Text('Carregou!!!'),
          duration: Duration(seconds: 3),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text('Efetuar Login'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              color: Colors.deepPurple,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.green[300]),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                hintText: 'Digite o seu email',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                ),
                              ),
                              onChanged: (value) => null,
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                enabled: true,
                                suffix: Icon(Icons.visibility),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Digite a sua senha',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onChanged: (value) => null,
                            ),
                            SizedBox(height: 20.0),
                            RaisedButton(
                              child: Text('Entrar'),
                              elevation: 5,
                              onPressed: () => Modular.to.pushNamed('/home'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
