import 'package:json_annotation/json_annotation.dart';

part 'concept.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Concept {
  Concept(this.id, this.icon, this.type, this.concept, this.definition,
      this.author, this.source, this.collection_id);

  int id;
  String icon;
  String type;
  String concept;
  String definition;
  String author;
  String source;
  int collection_id;

  factory Concept.fromJson(Map<String, dynamic> json) {
    return _$ConceptFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ConceptToJson(this);
}
