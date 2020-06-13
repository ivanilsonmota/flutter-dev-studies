import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/home/home_screen.dart';
import 'home_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomeScreen()),
      ];
  static Inject get to => Inject<HomeModule>.of();
}
