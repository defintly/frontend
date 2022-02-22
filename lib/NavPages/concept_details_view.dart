import 'dart:convert';
import 'dart:io';

import 'package:definitly_app/NavPages/concept_details.dart';
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
import 'package:intl/intl.dart';

class ConeptDetailsView extends StatelessWidget {
  late Concept index;
  late CommentList comments;
  late Collection collection;

  ConeptDetailsView(Concept index,CommentList comments){
    this.index = index;
    this.comments = comments;
    collection = dataApi.getMatchingCollection(index);
  }



  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                //width: MediaQuery.of(context).size.width * 0.9,
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
                      width: 300 //MediaQuery.of(context).size.width * 0.8,
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
                                  child: Text( DateFormat("dd-MM-yyyy HH:mm:ss").format(comments.comments[index].creationTime)
                                  )
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

    if(comment.isEmpty){
      return;
    }

    var jsonComment = {"text" : comment};
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
      return;
    }

    var client = http.Client();
    var body = json.encode(jsonComment);
    var result;
    try {
      var response = await client.post(
          Uri.parse("https://defintly.knoblich.co/concepts/" + index.id.toString() + "/comments"),
          headers: {
            "X-Auth-Key" : key,
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
    if (result["text"] == comment){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => ConceptDetails(index)));
    }
  }
}
