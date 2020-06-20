import 'package:flutter_modular/flutter_modular.dart';

import 'register_controller.dart';
import 'register_screen.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterScreen()),
      ];
}
