import 'dart:convert';
import 'dart:io';

import 'package:definitly_app/modals/collection.dart';
import 'package:definitly_app/modals/concept.dart';
import 'package:definitly_app/modals/login.dart';
import 'package:definitly_app/saveLoginData.dart';
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
import 'package:definitly_app/NavPages/login.dart';
import 'package:http/http.dart' as http;

class ConeptDetailsView extends StatelessWidget {
  final Concept index;
  final CommentList comments;

  ConeptDetailsView(this.index, this.comments);

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var collection = dataApi.getMatchingCollection(index);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
            title: Text(
          index.author,
        )),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(collection.collection,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text("Concept",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800])),
              ),
              Container(
                child: Markdown(
                    onTapLink: (text, url, title) async =>
                        {if (url != null) await launch(url)},
                    physics: NeverScrollableScrollPhysics(),
                    data: index.definition.replaceAll("\\n", "\\\n"),
                    shrinkWrap: true,
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme:
                            TextTheme(bodyText2: TextStyle(fontSize: 16.0))))),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Container(
                child: Markdown(
                    onTapLink: (text, url, title) async =>
                        {if (url != null) await launch(url)},
                    physics: NeverScrollableScrollPhysics(),
                    data: index.source.replaceAll("\\n", "\\\n"),
                    shrinkWrap: true,
                    styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                        textTheme:
                            TextTheme(bodyText2: TextStyle(fontSize: 16.0))))),
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: "Post a comment...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    IconButton(
                        onPressed: () {
                          sendComment(commentController.text, context, index);
                        },
                        icon: Icon(Icons.arrow_forward_sharp))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: comments.comments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(comments.comments[index].author),
                                ),
                                Container(
                                  child: Text(comments
                                          .comments[index].creationTime.day
                                          .toString() +
                                      "-" +
                                      comments
                                          .comments[index].creationTime.month
                                          .toString() +
                                      "-" +
                                      comments.comments[index].creationTime.year
                                          .toString()),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Text(comments.comments[index].text),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ]));
  }

  Future<void> sendComment(String comment, BuildContext context, Concept index) async {
    var key = "";
    var jsonComment = '{"text" : ' + '"' + comment + '"}';
    key = saveLoginData.key;
    if (key.isEmpty) {
      var key = saveLoginData.read();
    }

    if (key.isEmpty) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('error'),
                content: Text('not Logged in'),
              ));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => login()));
    }

    var client = http.Client();
    var body = json.encode(jsonComment);
    var result = "";
    try {
      var response = await client.post(
          Uri.parse("https://defintly.knoblich.co/concepts/" + index.id.toString() + "/comments"),
          headers: {
            HttpHeaders.authorizationHeader: key,
          },
          body: body);
      result = json.decode(response.body);
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('error'),
            content: Text('something went wrong'),
          ));
    } finally {
      client.close();
    }
  }
}
