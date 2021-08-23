import 'package:json_annotation/json_annotation.dart';

part 'criteria.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Criteria {
  Criteria(
      this.id,
      this.icon,
      this.quality_criterion,
      this.description_short,
      this.description_long,
      this.example,
      this.explanation,
      this.type,
      this.category_id,
      this.references);

  int id;
  String icon;
  String quality_criterion;
  String description_short;
  String description_long;
  String example;
  String explanation;
  String type;
  int category_id;
  String references;

  factory Criteria.fromJson(Map<String, dynamic> json) {
    return _$CriteriaFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CriteriaToJson(this);
}
