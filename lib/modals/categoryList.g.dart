// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) {
  return CategoryList(
    (json['categories'] as List<dynamic>)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
