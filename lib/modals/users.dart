import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class users {
  users(
      this.id,
      this.user,
      );

  int id;
  int user;


  factory users.fromJson(Map<String, dynamic> json) {
    return _$usersFromJson(json);
  }
  Map<String, dynamic> toJson() => _$usersToJson(this);
}