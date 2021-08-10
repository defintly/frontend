// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllData _$AllDataFromJson(Map<String, dynamic> json) {
  return AllData(
    (json['categorys'] as List)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllDataToJson(AllData instance) => <String, dynamic>{
      'categorys': instance.categorys.map((e) => e.toJson()).toList(),
    };
