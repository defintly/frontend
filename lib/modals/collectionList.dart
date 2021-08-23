import 'package:json_annotation/json_annotation.dart';
import 'package:definitly_app/modals/collection.dart';

part 'collectionList.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class CollectionList {
  CollectionList(this.collections);

  List<Collection> collections;

  factory CollectionList.fromJson(Map<String, dynamic> json) {
    return _$CollectionListFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CollectionListToJson(this);
}
