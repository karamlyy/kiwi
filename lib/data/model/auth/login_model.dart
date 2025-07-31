class LoginModel {
  String? token;
  User? user;
  String? refreshToken;

  LoginModel({
    this.token,
    this.user,
    this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        refreshToken: json["refreshToken"],
      );
}

class User {
  int? id;
  String? username;
  String? name;

  User({
    this.id,
    this.username,
    this.name,

  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["username"],

      );
}
