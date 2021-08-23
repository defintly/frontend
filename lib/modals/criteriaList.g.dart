// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criteriaList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriteriaList _$CriteriaListFromJson(Map<String, dynamic> json) {
  return CriteriaList(
    (json['criteria'] as List<dynamic>)
        .map((e) => Criteria.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CriteriaListToJson(CriteriaList instance) =>
    <String, dynamic>{
      'criteria': instance.criteria.map((e) => e.toJson()).toList(),
    };
