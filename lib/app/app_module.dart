import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/app_widget.dart';
import 'package:portfolio/app/modules/home/home_controller.dart';
import 'package:portfolio/app/modules/login/login_controller.dart';
import 'package:portfolio/app/modules/login/login_module.dart';
import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/post/post_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/post', module: PostModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
