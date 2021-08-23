import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Collection {
  Collection(
    this.id,
    this.icon,
    this.collection,
    this.type,
  );

  int id;
  String icon;
  String collection;
  String type;

  factory Collection.fromJson(Map<String, dynamic> json) {
    return _$CollectionFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
