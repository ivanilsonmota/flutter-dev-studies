class UserModel {
  String _name;

  String _email;

  String _password;

  UserModel({String name, String email, String password}) {
    this._name = name;
    this._email = email;
    this._password = password;
  }

  String get name => _name;
  set name(String name) => _name = name;

  String get email => _email;
  set email(String email) => _email = email;

  String get password => _password;
  set password(String password) => _password = password;

  UserModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['password'] = this._password;
    return data;
  }

  static List<UserModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<UserModel>((item) => UserModel.fromJson(item)).toList();
  }
}
