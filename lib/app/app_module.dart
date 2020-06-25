import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/auth/auth_repository.dart';
import 'core/auth/auth_repository_interface.dart';
import 'core/repositories/post_repository.dart';
import 'modules/home/home_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_module.dart';
import 'modules/login/register/register_module.dart';
import 'modules/post/post_module.dart';

class AppModule extends MainModule {
  final SharedPreferences sharedPreferences;

  AppModule(this.sharedPreferences);

  @override
  List<Bind> get binds => [
        //  Bind((i) => LocalStorageHive()),
        Bind((i) => AppController()),
        Bind((i) => LoginController()),
        Bind((i) => HomeController(i.get<PostRepository>())),
        Bind((i) => PostRepository(Dio(), AppModule.to.get())),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => sharedPreferences),
      ];

  @override
  List<Router> get routers => [
        //Router(Modular.initialRoute, module: HomeModule()),
        Router(Modular.initialRoute, module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/post', module: PostModule()),
        Router('/register', module: RegisterModule(), transition: TransitionType.downToUp)
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
