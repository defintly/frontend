// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Excample _$ExcampleFromJson(Map<String, dynamic> json) {
  return Excample(
    json['year'] as String,
    json['author'] as String,
    json['rxcampleText'] as String,
  );
}

Map<String, dynamic> _$ExcampleToJson(Excample instance) => <String, dynamic>{
      'year': instance.year,
      'author': instance.author,
      'rxcampleText': instance.rxcampleText,
    };
