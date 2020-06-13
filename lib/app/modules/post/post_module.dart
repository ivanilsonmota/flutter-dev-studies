import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/post/post_controller.dart';
import 'package:portfolio/app/modules/post/post_screen.dart';

class PostModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => PostController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, __) => PostScreen()),
      ];
}
