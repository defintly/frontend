// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criterion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Criterion _$CriterionFromJson(Map<String, dynamic> json) {
  return Criterion(
    json['index'] as int,
    json['descriptionLong'] as String,
    json['descriptionShort'] as String,
    json['idCriterion'] as String,
    json['qualityCriterion'] as String,
    (json['excample'] as List)
        .map((e) => Excample.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CriterionToJson(Criterion instance) => <String, dynamic>{
      'index': instance.index,
      'descriptionLong': instance.descriptionLong,
      'descriptionShort': instance.descriptionShort,
      'idCriterion': instance.idCriterion,
      'qualityCriterion': instance.qualityCriterion,
      'excample': instance.excample.map((e) => e.toJson()).toList(),
    };
