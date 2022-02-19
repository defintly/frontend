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

class ConceptDetails extends StatelessWidget {
  final Concept index;
  late CommentList comments;
  final myController = TextEditingController();
  static var _formKey = GlobalKey<FormState>();

  ConceptDetails(this.index);

  @override
  Widget build(BuildContext context) {
    var collection = dataApi.getMatchingCollection(index);

    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
            title: Text(index.author, style: TextStyle(color: Colors.amber),)),
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
                    return ListView(
                        children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(collection.collection,
                                        style: TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Concept",
                                        style: TextStyle(fontSize: 16,
                                            color: Colors.grey[800])),
                                  ),
                                  Container(
                                    child: Markdown(
                                        onTapLink: (text, url, title) async =>
                                        {if (url != null) await launch(url)},
                                        physics: NeverScrollableScrollPhysics(),
                                        data: index.definition.replaceAll(
                                            "\\n", "\\\n"),
                                        shrinkWrap: true,
                                        styleSheet: MarkdownStyleSheet
                                            .fromTheme(ThemeData(
                                            textTheme:
                                            TextTheme(bodyText2: TextStyle(
                                                fontSize: 16.0))))),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.9,
                                  ),
                                  Container(
                                    child: Markdown(
                                        onTapLink: (text, url, title) async =>
                                        {if (url != null) await launch(url)},
                                        physics: NeverScrollableScrollPhysics(),
                                        data: index.source.replaceAll(
                                            "\\n", "\\\n"),
                                        shrinkWrap: true,
                                        styleSheet: MarkdownStyleSheet
                                            .fromTheme(ThemeData(
                                            textTheme:
                                            TextTheme(bodyText2: TextStyle(
                                                fontSize: 16.0))))),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.9,
                                  ),
                                ],
                              ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: comments.comments.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(comments.comments[index].text),),
                                Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(comments.comments[index].author),
                                ),
                                  ],
                                );
                              }),
                          /*Row(
                            children: [
                              Container(
                                width: 300,
                                  child: TextField(
                                    key: _formKey,
                                controller: myController,
                                  ),
                              ),
                                FloatingActionButton(
                                // When the user presses the button, show an alert dialog containing
                                // the text that the user has entered into the text field.
                                onPressed: () {
                                    },
                                  )
                            ],
                          )*/
                        ]
                    );
                  }
              }
            }));
  }

  Future<void> getComments() async {
    comments = await dataApi.getMatchingComments(index.id);
    comments.comments.removeWhere((comment) => comment.allowed == false);
    if(comments.comments.isEmpty){
      comments.comments.add(new Comment(0,0,"no comments",true,"0"));
    }
  }
}