import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var shared = await SharedPreferences.getInstance();

  runApp(ModularApp(module: AppModule(shared)));

  //print(Firestore.instance.collection("products").document().setData({"id": 2, "name": "Marcio", "email": "marcio@gmail.com", "password": "131334"}));
}
