// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['id'] as String,
    json['category'] as String,
    json['discription'] as String,
    (json['criterion'] as List)
        .map((e) => Criterion.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'discription': instance.discription,
      'criterion': instance.criterion.map((e) => e.toJson()).toList(),
    };
