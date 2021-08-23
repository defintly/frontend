// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conceptList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConceptList _$ConceptListFromJson(Map<String, dynamic> json) {
  return ConceptList(
    (json['concepts'] as List<dynamic>)
        .map((e) => Concept.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ConceptListToJson(ConceptList instance) =>
    <String, dynamic>{
      'concepts': instance.concepts.map((e) => e.toJson()).toList(),
    };
