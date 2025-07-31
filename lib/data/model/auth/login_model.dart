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
  String? company;
  String? branch;
  int? branchId;
  int? companyId;
  int? employeeId;
  int? userRoleId;
  String? userRole;

  User({
    this.id,
    this.username,
    this.name,
    this.company,
    this.branch,
    this.branchId,
    this.companyId,
    this.employeeId,
    this.userRoleId,
    this.userRole,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["username"],
        company: json["company"],
        branch: json["branch"],
        branchId: json["branchId"],
        companyId: json["companyId"],
        employeeId: json["employeeId"],
        userRoleId: json["userRoleId"],
        userRole: json["userRole"],
      );
}
