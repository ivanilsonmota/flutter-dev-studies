import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/app/core/auth/auth_repository.dart';
import 'package:portfolio/app/core/auth/auth_repository_interface.dart';
import 'package:portfolio/app/core/models/post_model.dart';
import 'package:portfolio/app/core/repositories/post_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerStore with _$HomeController;

abstract class _HomeControllerStore with Store {
  final IAuthRepository authRepository = Modular.get<AuthRepository>();
  final PostRepository postRepository;
  var dio = Dio();

  _HomeControllerStore(this.postRepository) {
    getData();
  }

  @observable
  List<PostModel> postList;

  @observable
  int currentIndex = 0;

  @action
  getData() {
    postRepository.fetchPost().then((data) {
      postList = data;
    });
  }

  @action
  Future<Null> refresh() async {
    await getData();
    return null;
  }
}
