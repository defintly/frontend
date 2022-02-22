// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return Register(
    json['username'] as String,
    json['mail'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'username': instance.username,
      'mail': instance.mail,
      'password': instance.password,
    };
