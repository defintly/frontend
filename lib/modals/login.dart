import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Login {
  Login(
      this.usernameOrMail,
      this.password
      );

  String usernameOrMail;
  String password;

  factory Login.fromJson(Map<String, dynamic> json) {
    return _$LoginFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}