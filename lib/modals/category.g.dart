// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['id'] as int,
    json['icon'] as String,
    json['category'] as String,
    json['type'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'category': instance.category,
      'type': instance.type,
      'description': instance.description,
    };
