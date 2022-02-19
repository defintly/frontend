import 'package:json_annotation/json_annotation.dart';
import 'package:definitly_app/modals/comment.dart';

part 'commentList.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class CommentList {
  CommentList(this.comments);

  List<Comment> comments;

  factory CommentList.fromJson(Map<String, dynamic> json) {
    return _$CommentListFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CommentListToJson(this);
}