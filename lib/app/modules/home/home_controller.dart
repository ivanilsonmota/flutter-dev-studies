import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/app/core/models/post_model.dart';
import 'package:portfolio/app/core/repositories/post_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerStore with _$HomeController;

abstract class _HomeControllerStore with Store {
  var dio = Dio();
  final PostRepository postRepository;

  _HomeControllerStore(this.postRepository) {
    getData();
  }

  @observable
  List<PostModel> postList;

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
