import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Category {
  Category(
    this.id,
    this.icon,
    this.category,
    this.type,
    this.description,
  );

  int id;
  String icon;
  String category;
  String type;
  String description;

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
