// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentList _$CommentListFromJson(Map<String, dynamic> json) {
  return CommentList(
    (json['comments'] as List<dynamic>)
        .map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CommentListToJson(CommentList instance) =>
    <String, dynamic>{
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
