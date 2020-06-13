import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Página principal"),
            RaisedButton(
              child: Text('Login'),
              onPressed: () => Modular.to.pushNamed('/post'),
              elevation: 0,
              animationDuration: Duration(seconds: 2),
            ),
          ],
        ),
      ),
    );
  }
}
