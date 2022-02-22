// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return LoginResult(
    json['id'] as int,
    json['username'] as String,
    json['session_key'] as String,
  );
}

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'session_key': instance.sessionKey,
    };
