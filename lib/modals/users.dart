import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Users {
  Users(
      this.id,
      this.username,
      );

  int id;
  String username;


  factory Users.fromJson(Map<String, dynamic> json) {
    return _$UsersFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}