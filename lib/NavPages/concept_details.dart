import 'dart:async';

import 'package:definitly_app/modals/collection.dart';
import 'package:definitly_app/modals/concept.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:definitly_app/navigation.dart';
import 'package:definitly_app/modals/comment.dart';
import 'package:definitly_app/modals/commentList.dart';
import 'package:definitly_app/commentWidget.dart';
import 'package:flutter/scheduler.dart';

import 'concept_details_view.dart';

class ConceptDetails extends StatefulWidget {
  final Concept index;

  ConceptDetails(this.index);

  @override
  State<ConceptDetails> createState() => _ConceptDetailsState();
}

class _ConceptDetailsState extends State<ConceptDetails> {
  late CommentList comments;

  final commentController = TextEditingController();

  String comment = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var collection = dataApi.getMatchingCollection(widget.index);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavigationDrawerWidget(),
        body: FutureBuilder(
            future: Future.wait([getComments()]),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(child: Text('Some error occurred!'));
                  } else {
                    return Container(
                      child: ConeptDetailsView(widget.index, comments)
                    );
                  }
              }
            }));
  }


  Future<void> getComments() async {
    comments = await dataApi.getMatchingComments(widget.index.id);
    comments.comments.removeWhere((comment) => comment.allowed == false);
    if (comments.comments.isEmpty) {
      comments.comments
          .add(new Comment(0, 0, "no comments", true, DateTime(0)));
    } else {
      for (var comment in comments.comments) {
        var user = await dataApi.getAuthor(comment.userId);
        comment.author = user;
      }
    }
  }
}
