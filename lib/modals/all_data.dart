import 'package:json_annotation/json_annotation.dart';
import 'category.dart';

part 'all_data.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class AllData {

  AllData(
    this.categorys,
      );


  List<Category> categorys;

  factory AllData.fromJson(Map<String, dynamic> json) {
    return _$AllDataFromJson(json);
  }
  Map<String, dynamic> toJson() => _$AllDataToJson(this);
}