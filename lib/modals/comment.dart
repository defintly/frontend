import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Comment {
  Comment(
      this.id,
      this.userId,
      this.text,
      this.allowed,
      this.creationTime,
      );

  int id;
  int userId;
  String text;
  bool allowed;
  DateTime creationTime;
  String author = "";

  factory Comment.fromJson(Map<String, dynamic> json) {
    return _$CommentFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}