import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Register {
  Register(
      this.username,
      this.mail,
      this.password);

  String username;
  String mail;
  String password;

  factory Register.fromJson(Map<String, dynamic> json) {
    return _$RegisterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
