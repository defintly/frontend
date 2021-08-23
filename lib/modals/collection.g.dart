// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return Collection(
    json['id'] as int,
    json['icon'] as String,
    json['collection'] as String,
    json['type'] as String,
  );
}

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'collection': instance.collection,
      'type': instance.type,
    };
