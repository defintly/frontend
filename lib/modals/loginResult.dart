import 'package:json_annotation/json_annotation.dart';

part 'loginResult.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class LoginResult {
  LoginResult(
      this.id,
      this.username,
      this.sessionKey);

  int id;
  String username;
  String sessionKey;

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return _$LoginResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
