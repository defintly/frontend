// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Criteria _$CriteriaFromJson(Map<String, dynamic> json) {
  return Criteria(
    json['id'] as int,
    json['icon'] as String,
    json['quality_criterion'] as String,
    json['description_short'] as String,
    json['description_long'] as String,
    json['example'] as String,
    json['explanation'] as String,
    json['type'] as String,
    json['category_id'] as int,
    json['references'] as String,
  );
}

Map<String, dynamic> _$CriteriaToJson(Criteria instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'quality_criterion': instance.quality_criterion,
      'description_short': instance.description_short,
      'description_long': instance.description_long,
      'example': instance.example,
      'explanation': instance.explanation,
      'type': instance.type,
      'category_id': instance.category_id,
      'references': instance.references,
    };
