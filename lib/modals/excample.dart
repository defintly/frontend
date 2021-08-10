import 'package:json_annotation/json_annotation.dart';

part 'excample.g.dart';

@JsonSerializable( nullable: false)
class Excample {
  Excample(
      this.year,
      this.author,
      this.rxcampleText,);

  String year;
  String author;
  String rxcampleText;

  factory Excample.fromJson(Map<String, dynamic> json) => _$ExcampleFromJson(json);
  Map<String, dynamic> toJson() => _$ExcampleToJson(this);
}