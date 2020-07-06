import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/app/core/repositories/post_repository.dart';

part 'post_controller.g.dart';

class PostController = _PostController with _$PostController;

abstract class _PostController with Store {
  PostRepository postRepository = Modular.get<PostRepository>();
}
