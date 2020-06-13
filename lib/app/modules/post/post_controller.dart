import 'package:mobx/mobx.dart';

part 'post_controller.g.dart';

class PostController = _PostController with _$PostController;

abstract class _PostController with Store {}
