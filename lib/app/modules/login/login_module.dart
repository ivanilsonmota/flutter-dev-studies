import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';
import 'login_screen.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginScreen()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
