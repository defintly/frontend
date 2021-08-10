import 'package:json_annotation/json_annotation.dart';
import 'criterion.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Category {
  Category(
      this.id,
      this.category,
      this.discription,
      this.criterion
  );

  String id;
  String category;
  String discription;
  List<Criterion> criterion;

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}