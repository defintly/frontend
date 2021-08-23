import 'package:json_annotation/json_annotation.dart';
import 'package:definitly_app/modals/criteria.dart';

part 'criteriaList.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class CriteriaList {
  CriteriaList(this.criteria);

  List<Criteria> criteria;

  factory CriteriaList.fromJson(Map<String, dynamic> json) {
    return _$CriteriaListFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CriteriaListToJson(this);
}
