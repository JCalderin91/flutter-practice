import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.user,
  });

  User user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    // this.id,
    this.name,
    this.email,
  });

  // int id;
  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        // id: json["id"] as int,
        name: json["name"] as String,
        email: json["email"] as String,
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "email": email,
      };
}
