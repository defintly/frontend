// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Concept _$ConceptFromJson(Map<String, dynamic> json) {
  return Concept(
    json['id'] as int,
    json['icon'] as String,
    json['type'] as String,
    json['concept'] as String,
    json['definition'] as String,
    json['author'] as String,
    json['source'] as String,
    json['collection_id'] as int,
  );
}

Map<String, dynamic> _$ConceptToJson(Concept instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'type': instance.type,
      'concept': instance.concept,
      'definition': instance.definition,
      'author': instance.author,
      'source': instance.source,
      'collection_id': instance.collection_id,
    };
