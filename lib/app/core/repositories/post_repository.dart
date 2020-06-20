import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/core/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostRepository extends Disposable {
  final Dio post;
  final SharedPreferences sharedPreferences;

  PostRepository(this.post, this.sharedPreferences);

  Future<List<PostModel>> fetchPost() async {
    try {
      final res = await post.get('https://jsonplaceholder.typicode.com/posts');

      var value = PostModel.fromJsonList(res.data);

      sharedPreferences.setStringList('HomeRepository-fetchPost',
          value.map((item) => item.toJsonString()).toList());

      return value;
    } catch (e) {
      var value = sharedPreferences.getStringList('HomeRepository-fetchPost');
      return value.map((item) => PostModel.fromJsonString(item)).toList();
    }
  }

  @override
  void dispose() {}
}
