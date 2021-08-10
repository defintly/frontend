import 'excample.dart';
import 'package:json_annotation/json_annotation.dart';

part 'criterion.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Criterion {

  Criterion(
      this.index,
      this.descriptionLong,
      this.descriptionShort,
      this.idCriterion,
      this.qualityCriterion,
      this.excample);

  int index;
  String descriptionLong;
  String descriptionShort;
  String idCriterion;
  String qualityCriterion;
  List<Excample> excample;

  factory Criterion.fromJson(Map<String, dynamic> json) => _$CriterionFromJson(json);
  Map<String, dynamic> toJson() => _$CriterionToJson(this);
}