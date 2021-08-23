// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectionList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionList _$CollectionListFromJson(Map<String, dynamic> json) {
  return CollectionList(
    (json['collections'] as List<dynamic>)
        .map((e) => Collection.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CollectionListToJson(CollectionList instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
    };
