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
            Container(
              child: Markdown(
                  physics: NeverScrollableScrollPhysics(),
                  onTapLink: (text, url, title) async =>
                      {if (url != null) await launch(url)},
                  data: dataApi.footer,
                  shrinkWrap: true,
                  styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                      textTheme:
                          TextTheme(bodyText2: TextStyle(fontSize: 15.0))))),
            ),
            InkWell(
              onTap: () async => await launch('http://agisi.org/news.html'),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.lightBlue[200],
                ),
                child: Text(
                  "Learn more",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                width: MediaQuery.of(context).size.width * 1,
                height: 40,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/bg-agisibanner.jpg",
            ),
            Card(
                child: InkWell(
              onTap: () async => await launch('http://agisi.org/'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("AGISI- The AGI Sertinal Initative",
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text("AGISI.org",
                        style: TextStyle(
                          fontSize: 15,
                        ))
                  ]),
                  Icon(Icons.link, color: Colors.blue)
                ],
              ),
            )),
            Card(
                child: InkWell(
              onTap: () async => await launch("mailto:contact@defintly.com"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Contact",
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text("contact@definitly.com",
                        style: TextStyle(
                          fontSize: 15,
                        ))
                  ]),
                  Icon(Icons.email, color: Colors.blue)
                ],
              ),
            )),
            Image.asset(
              "assets/agisiLOGO.webp",
              height: 100,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
            ),
          ],
        )
      ]),
    );
  }
}
