import 'package:definitly_app/modals/collection.dart';
import 'package:definitly_app/modals/concept.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:definitly_app/data_api.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class ConceptDetails extends StatelessWidget {
  final Concept index;

  ConceptDetails(this.index);

  @override
  Widget build(BuildContext context) {
    var collection = dataApi.getMatchingCollection(index);
    return Scaffold(
      appBar: AppBar(title: Text(index.author)),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(collection.collection,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
            SizedBox(width: MediaQuery.of(context).size.width,height: 30),
            Container(
              alignment: Alignment.center,
              child: Text(
              "Comments",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )),
          ],
        )
      ]),
    );
  }
}
