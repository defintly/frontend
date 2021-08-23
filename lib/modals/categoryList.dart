import 'package:json_annotation/json_annotation.dart';
import 'package:definitly_app/modals/category.dart';

part 'categoryList.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class CategoryList {
  CategoryList(this.categories);

  List<Category> categories;

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return _$CategoryListFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
