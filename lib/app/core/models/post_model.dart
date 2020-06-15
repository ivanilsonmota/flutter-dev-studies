import 'dart:convert';

class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  factory PostModel.fromJsonString(String str) =>
      PostModel.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());

  static List<PostModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<PostModel>((item) => PostModel.fromJson(item)).toList();
  }
}
