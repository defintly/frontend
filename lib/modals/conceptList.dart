import 'package:json_annotation/json_annotation.dart';
import 'package:definitly_app/modals/concept.dart';

part 'conceptList.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class ConceptList {
  ConceptList(this.concepts);

  List<Concept> concepts;

  factory ConceptList.fromJson(Map<String, dynamic> json) {
    return _$ConceptListFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ConceptListToJson(this);
}
