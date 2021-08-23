import 'package:flutter/material.dart';
import 'package:definitly_app/modals/criteria.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:definitly_app/data_api.dart';
import 'package:definitly_app/modals/category.dart';
import 'package:url_launcher/url_launcher.dart';

import 'criteria_details.dart';

class CategoryDetails extends StatelessWidget {
  final Category indexCategory;

  CategoryDetails(this.indexCategory);

  @override
  Widget build(BuildContext context) {
    var criteria = dataApi.getMatchingCriteria(indexCategory);
    return Scaffold(
        appBar: AppBar(title: Text(indexCategory.category)),
        body: ListView(physics: ScrollPhysics(), children: [
          Column(children: [
            Container(
              child: Markdown(
                  physics: NeverScrollableScrollPhysics(),
                  onTapLink: (text, url, title) async =>
                      {if (url != null) await launch(url)},
                  data: indexCategory.category,
                  shrinkWrap: true,
                  styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                      textTheme:
                          TextTheme(bodyText2: TextStyle(fontSize: 25.0))))),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Quality Criterion",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Markdown(
                  onTapLink: (text, url, title) async =>
                      {if (url != null) await launch(url)},
                  physics: NeverScrollableScrollPhysics(),
                  data: indexCategory.description.replaceAll("\\n", "\\\n"),
                  shrinkWrap: true,
                  styleSheet: MarkdownStyleSheet.fromTheme(ThemeData(
                      textTheme:
                          TextTheme(bodyText2: TextStyle(fontSize: 16.0))))),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: criteria.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CriteriaDetails(criteria[index])));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Markdown(
                              onTapLink: (text, url, title) async =>
                                  {if (url != null) await launch(url)},
                              physics: NeverScrollableScrollPhysics(),
                              data: indexCategory.icon,
                              shrinkWrap: true,
                              styleSheet: MarkdownStyleSheet.fromTheme(
                                  ThemeData(
                                      textTheme: TextTheme(
                                          bodyText2:
                                              TextStyle(fontSize: 30.0))))),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Column(
                          children: [
                            Container(
                                child: Text(criteria[index].quality_criterion,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ))),
                            Container(
                                child: Text("Category",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800]))),
                          ],
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ));
                }),
            Container(
              child: Markdown(
                  onTapLink: (text, url, title) async =>
                      {if (url != null) await launch(url)},
                  physics: NeverScrollableScrollPhysics(),
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
                width: MediaQuery.of(context).size.width * 0.9,
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
            ),
          ])
        ]));
  }
}
