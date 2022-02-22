// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    json['username_or_mail'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username_or_mail': instance.usernameOrMail,
      'password': instance.password,
    };
