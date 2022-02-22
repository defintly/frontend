// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['id'] as int,
    json['user_id'] as int,
    json['text'] as String,
    json['allowed'] as bool,
    DateTime.parse(json['creation_time'] as String),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'text': instance.text,
      'allowed': instance.allowed,
      'creation_time': instance.creationTime.toIso8601String(),
    };
